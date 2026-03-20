# CLAUDE.md

Main guide for AI assistants working on this repository.

**Full documentation**: [`docs/AGENTS.md`](docs/AGENTS.md)

## Quick commands

```bash
make install        # Install all dependencies (Ruby + Bun)
make serve          # Dev server at http://localhost:4001
make build          # Development build
make production     # Production build
make clean          # Clean generated files
bun run lint        # Lint markdown and yaml
bun run lint:md:fix # Auto-fix markdown
bun run commit      # Interactive gitmoji commit
```

## Essential rules

1. **Always consult** `docs/AGENTS.md` before any modification
2. **Test both languages** (FR/EN) before committing
3. **Follow BEM** methodology for all CSS/SCSS
4. **Update documentation** when making changes
5. **Follow** conventions established in each `docs/` file
