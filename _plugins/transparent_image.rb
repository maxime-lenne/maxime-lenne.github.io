# frozen_string_literal: true

require 'zlib'

# Liquid filter telling whether a local image has a transparent background, so the logos that bring their own
# background are not padded:
#   {% assign padded = page.logo_url | transparent_image %}
#
# SVG files count as transparent, JPEG files never are. For a PNG, only the top row is decoded (it needs no
# previous row to unfilter): a pixel there with alpha < 255 means a transparent background. Only 8-bit PNGs
# are read: other depths, remote and missing files return false.
module TransparentImage
  PNG_SIGNATURE = "\x89PNG\r\n\x1A\n".b
  CACHE = {}

  def transparent_image(url)
    return false unless url.is_a?(String) && url.start_with?('/')

    path = File.join(@context.registers[:site].source, url.split('?').first)
    return false unless File.file?(path)

    CACHE[[path, File.mtime(path)]] ||= TransparentImage.transparent?(path)
  end

  def self.transparent?(path)
    case File.extname(path).downcase
    when '.svg' then true
    when '.png' then png_top_row_transparent?(File.binread(path))
    else false
    end
  rescue StandardError
    false
  end

  def self.png_top_row_transparent?(data)
    return false unless data.start_with?(PNG_SIGNATURE)

    header, palette_alpha, idat = png_chunks(data)
    width, = header.unpack('N')
    depth, color_type, = header.byteslice(8, 3).unpack('C3')
    return false unless depth == 8

    channels = { 0 => 1, 2 => 3, 3 => 1, 4 => 2, 6 => 4 }.fetch(color_type)
    row = top_row(Zlib::Inflate.inflate(idat), width * channels, channels)
    case color_type
    when 4, 6 then (channels - 1).step(row.size - 1, channels).any? { |i| row[i] < 255 }
    # Palette entries beyond the tRNS chunk are opaque
    when 3 then !palette_alpha.nil? && row.any? { |index| index < palette_alpha.bytesize && palette_alpha.getbyte(index) < 255 }
    else !palette_alpha.nil?
    end
  end

  def self.png_chunks(data)
    offset = 8
    header = palette_alpha = nil
    idat = +''.b
    while offset < data.bytesize
      length, type = data.byteslice(offset, 8).unpack('Na4')
      body = data.byteslice(offset + 8, length)
      case type
      when 'IHDR' then header = body
      when 'tRNS' then palette_alpha = body
      when 'IDAT' then idat << body
      when 'IEND' then break
      end
      offset += length + 12
    end
    [header, palette_alpha, idat]
  end

  # Unfilters the first scanline. The previous row is all zeros there: Up adds nothing, Paeth picks the left
  # byte like Sub, Average adds half of it
  def self.top_row(raw, size, bpp)
    filter = raw.getbyte(0)
    bytes = raw.byteslice(1, size).bytes
    bytes.each_index do |i|
      left = i >= bpp ? bytes[i - bpp] : 0
      case filter
      when 1, 4 then bytes[i] = (bytes[i] + left) & 0xff
      when 3 then bytes[i] = (bytes[i] + (left / 2)) & 0xff
      end
    end
    bytes
  end
end

Liquid::Template.register_filter(TransparentImage)
