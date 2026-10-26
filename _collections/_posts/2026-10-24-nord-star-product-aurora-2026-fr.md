---
layout: post
lang: fr
permalink: /blog/nord-star-product-aurora-2026/
alternate_lang: en
alternate_url: /en/blog/nord-star-product-aurora-2026/
title: "Nord Star Product 2026, édition Aurora : ce que je retiens des 7 talks"
description: "Lovable, Éno, Kiabi, La Redoute, Petit Bambou, Design Sprint : mon retour sur Nord Star Product Aurora à Tourcoing, et les citations à retenir."
date: 2026-10-24
image:
  path: /assets/images/posts/nord-star-product-edition-aurora-2026/design-sprint-where-ai-helps.jpeg
  alt: "Stéphane Cruchon devant la slide « Où l'IA apporte de la valeur » du Design Sprint"
tags: [product, design, ia, conference]
---

**« Nous n'avons pas gagné du temps pour aller plus vite, mais pour passer plus de temps sur ce qui compte vraiment. »**
Cette phrase d'Anthony Lefebvre et Mathéo Evrard, prononcée sur la scène de Nord Star Product le 22 octobre 2026,
résume assez bien la journée. Tout le monde a parlé d'IA. Presque personne n'a dit qu'elle allait décider à notre place.

Voici mon retour sur l'édition Aurora : le programme, les idées et les citations de chaque talk, puis ce que j'en
garde, côté tech comme côté humain.

## Nord Star Product, édition Aurora

[Nord Star Product](https://nordstarproduct.com/lineup) est la journée design et produit des Hauts-de-France. Elle est
organisée par la communauté Nord Star Product et EuraCreative, la structure qui
accompagne les entreprises culturelles et créatives sur le site de la Plaine Images.

- **Date** : jeudi 22 octobre 2026.
- **Lieu** : Plaine Images, Tourcoing.
- **Format** : 45 minutes de talk en salle, puis 15 minutes de pause dehors, parce que « les meilleurs moments d'une
  conférence, c'est à la machine à café ».
- **Le soir** : after party avec pizzas, bières craft, cocktails et le DJ set de Tremolo.

| Heure | Intervenants                         | Talk                                                                                     |
| ----- | ------------------------------------ | ---------------------------------------------------------------------------------------- |
| 09h00 | Arthur Hilhorst (Lovable)            | Trop rapide pour réfléchir                                                               |
| 10h00 | Noé Chagué et Maxime Podgorski (Éno) | Le futur du design avec l'agentique                                                      |
| 11h00 | Anthony Lefebvre et Mathéo Evrard    | On a pété le Double Diamant !                                                            |
| 13h30 | Karine Dusart et Renaud Dorizon      | Les 60 premiers jours d'un CPO (table ronde)                                             |
| 14h40 | Anicet Bart (Solfy)                  | Maintenant tout le monde sait builder. Mais comment acquérir et conserver des utilisateurs ? |
| 15h15 | Stéphane Cruchon                     | Le Design Sprint à l'ère de l'IA : décider vite, et juste                                |
| 16h15 | Roger Ingouacka (Petit Bambou)       | REX : la vie d'un véritable Product Builder !                                            |

## Ce que je retiens de chaque talk

### Arthur Hilhorst (Lovable) : trop rapide pour réfléchir

Arthur est product designer chez Lovable, la start-up suédoise qui génère des applications avec l'IA : environ
60 millions de projets créés, plus d'un million par semaine, et bientôt un milliard de visites par mois sur les apps
générées. Son talk tenait en trois mots : **vitesse, contexte, intention**.

- **Vitesse.** Il a demandé à la salle de choisir entre réflexion et vitesse : à peine 20 à 30 % des mains côté
  réflexion. Tout le monde ressent la tension.
- **Contexte.** Piloter 10, 20 ou 30 agents en parallèle crée une charge cognitive énorme. Chez Lovable, un « deuxième
  cerveau », un LLM interne branché sur la codebase et les retours utilisateurs, garde la mémoire à leur place.
- **Intention.** Les outils d'IA nous propulsent trop vite dans l'espace solution, en sautant l'exploration du
  problème.

Côté organisation : les designers shippent directement dans la codebase, 70 à 90 % des pull requests sont générées par
l'IA, et il n'y a plus de design system dans Figma. La source de vérité, c'est le code.

Le passage qui m'a le plus parlé porte sur la charge cognitive. Avant, on jonglait entre Jira, Miro et Figma.
Aujourd'hui, on jongle avec 10 onglets, 10 agents et 10 contextes à garder en tête. Arthur l'a testé : on peut piloter
20 ou 30 agents, mais pas mener en même temps une réflexion de fond sur plusieurs jours. Les agents génèrent tellement,
et si vite, que le cerveau ne retient plus tout et décroche. Et c'est quand on perd le contrôle qu'on brûle les
détails. D'où le « deuxième cerveau » : une mémoire externe qui garde le contexte pour nous. Avec une limite, donnée en
réponse à une question de la salle : trop de contexte donne des réponses génériques, il vaut mieux partir d'une source
et l'équilibrer ensuite.

> « Vous avez juste un cerveau, donc vous ne pouvez pas tout faire. »
>
> « Si tout le monde part du même niveau, sans intention, les choses commencent vraiment à se ressembler. »
>
> « Si vous vous demandez ce que veulent dire le craft et le goût, regardez Apple. »

Son exemple m'a marqué : les flyers du supermarché, tous générés avec ChatGPT, où l'affiche de la manif ressemble à
celle des cours de piano. La différence se fera sur le craft et le goût, d'où un rôle qui émerge chez Lovable : des
profils artistiques qui comprennent le code et itèrent des milliers de fois sur un détail visuel.

### Noé Chagué et Maxime Podgorski (Éno) : un design system « AI ready »

Éno aide les entreprises à automatiser leur activité (facturation, site, etc.). Son équipe design travaille directement
dans le code. Leur cas concret : la semaine de lancement du 17 novembre, avec **143 écrans générés en une semaine**,
dont une soixantaine en moins de 24 heures.

Le point de départ : nos premières expériences avec les agents sont décevantes. Composants recréés, tokens ignorés,
règles d'espacement oubliées. Pour l'équipe d'Éno, un agent se pose trois questions dès qu'on lui donne une
intention : qu'est-ce que j'utilise ? Qu'est-ce que j'ai le droit de faire ? Et que faire quand la réponse n'existe
pas ? C'est la troisième qui compte.

Leur réponse :

- **Les composants sont des données** : nom, type, cas d'usage, description, état et statut (utilisable par les agents
  ou non).
- **Des tokens sémantiques**, parce que c'est ce que l'agent utilise vraiment, et deux MCP : l'un pour retrouver les
  composants, l'autre pour retrouver les références d'inspiration sauvegardées.
- **Tout est une pull request**, 100 à 150 par jour. La CI vérifie la qualité, la conformité au design system, la
  non-régression, les métadonnées et l'entrée de changelog. C'est le dernier rempart.
- **Quand un composant manque**, l'agent ouvre lui-même l'issue, l'assigne, et la traite seul si elle est simple.

Le résultat de la semaine : 80 % des écrans shippés après review, 20 % qui ont révélé des trous dans le système. Et ce
sont ces 20 % qui ont eu le plus de valeur.

> « Ce qui est intéressant, ce ne sont pas les 140 écrans shippés, c'est le manque, là où le système était
> insuffisant. »
>
> « À partir du moment où c'est clair pour un agent, ça l'est forcément pour un humain. »
>
> « Les bons designers ont des années devant eux. »

Leur échelle de maturité est simple. Niveau 1 : l'agent devine quel composant utiliser. Niveau 2 : métadonnées, tokens
et intentions documentées, l'agent obéit à vos conventions. Niveau 3, « AI ready » : le système vous parle et vous dit
à quel moment il est insuffisant.

### Anthony Lefebvre et Mathéo Evrard (Kiabi) : on a pété le Double Diamant

Le sujet est arrivé par hasard, dans un couloir : la collecte de vêtements d'occasion de Kiabi, qui marche très bien
en magasin et sur l'app (quatre fois plus de volume que sur le web), devait évoluer vers un envoi depuis chez soi. La
réponse habituelle tombe : « on n'a pas le temps ». Ils se lancent le défi d'y répondre en moins de 48 heures.

![Slide « 6 phases. 16 heures. » : comprendre, modéliser, prototyper, questionner, tester, synthétiser]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/kiabi-6-phases-16-hours.jpeg' | absolute_url }})

_Le Double Diamant compressé : six phases, seize heures de travail sur 48 heures._

- **Comprendre et modéliser (2 h)** : un atelier avec le métier, trois parcours possibles, un seul retenu, le plus
  simple pour les utilisateurs comme pour les développeurs.
- **Prototyper (7 h)** : Claude branché sur Figma, avec un an de maquettes et un design system solide comme base de
  connaissance. Un plugin Figma maison sert d'UX writer. Les prototypes « ready to dev » sont déployés sur Vercel.
- **Tester (4 h)** : descente en magasin le 9 juillet, 5 clients et 3 collaborateurs.
- **Synthétiser (2 h)** : 57 verbatims codés par l'IA (hypothèse, question de recherche, signal) dans une base Notion,
  puis réinjectés dans les maquettes Figma.

![Slide « 80 % l'IA, 20 % nous » : l'IA fait le gros du travail, l'équipe les détails qui font la différence]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/kiabi-80-20.jpeg' | absolute_url }})

_80 % pour l'IA (écrans, questionnaire, synthèse), 20 % pour l'équipe : les détails qui font la différence._

Le plus intéressant, c'est ce que l'IA n'a pas compressé. Trois fois, le chrono a ralenti : **choisir** la direction,
**trancher** entre les options, **aller voir** les gens. Un quart du temps, et l'essentiel de ce qu'ils ont appris.

![Slide « Trois fois, le chrono a ralenti » : choisir, trancher, aller voir]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/kiabi-clock-slowed-down.jpeg' | absolute_url }})

> « On a tous déjà utilisé cette excuse, mais aujourd'hui, avec l'IA, "on n'a pas le temps" n'est plus forcément
> valable. »
>
> « L'IA ne compresse que ce qui est déjà solide. »
>
> « Nous n'avons pas gagné du temps pour aller plus vite, mais pour passer plus de temps sur ce qui compte vraiment. »

### Karine Dusart et Renaud Dorizon : les 60 premiers jours d'un CPO

Une table ronde sur un sujet rarement traité en conférence : insuffler une culture produit dans des entreprises
historiques de la vente à distance, où « pendant très longtemps, le produit, c'était le catalogue ». Renaud est chez
La Redoute, où le produit est rattaché au marketing ; Karine est rattachée à une DSI.

- **Les 60 premiers jours.** En théorie : observer, écouter, voir son équipe comme un produit. En pratique : des
  décisions RH, budgétaires et opérationnelles à prendre dès la première semaine. Trois valeurs posées d'emblée :
  bienveillance, transparence, confiance.
- **Projet ou produit ?** Pas d'opposition. Les grands projets rassurent les actionnaires et défendent les budgets ;
  l'enjeu est d'y glisser de la discovery et de la vision.
- **Marketing ou DSI ?** Le marketing donne les leviers budgétaires, la DSI la proximité avec la tech mais rend plus
  difficile l'engagement du métier. Pas de bonne réponse universelle.
- **Recruter.** Pour un PM, des soft skills, de la posture et la maîtrise de ses insights plutôt que des hard skills
  seuls. Pour un designer, une vision produit au-delà de la maquette, et une sensibilité tech devenue essentielle.
- **L'IA.** Les contraintes de sécurité, de licences et de budget empêchent d'aller aussi vite que dans les démos du
  matin. À La Redoute, un PM est désormais builder IA à plein temps, avec des ambassadeurs dans chaque équipe.

> « Le métier, ça va être votre BFF » (votre meilleur allié).
>
> « La culture, ça ne se fait pas en un mois, ni même peut-être en un an. C'est ce qui reste une fois qu'on part
> d'une entreprise. »
>
> « On ne pousse pas des maquettes, on pousse des expériences. »
>
> « Accepter, en tant que leader, que mon équipe perde parfois du temps à explorer l'IA. Et je n'ai pas peur de le
> dire. »

Karine a aussi cité _Transformed_ de Marty Cagan : le plus important n'est pas d'adopter un process, mais de gagner la
confiance du business. Et Renaud a donné son filtre de priorisation : « quelle est ma valeur ajoutée sur ce sujet ? ».
Ses N-1 sont là pour qu'il leur fasse confiance.

### Anicet Bart (Solfy) : tout le monde sait builder, et après ?

Anicet a fondé Solfy, une application d'apprentissage du solfège incubée sur le site. Son message : construire n'est
plus le problème, trouver et garder des utilisateurs, si.

- Mettre le produit entre les mains des utilisateurs dès les premières semaines.
- Accompagner : un produit nouveau demande un temps d'adoption, le support est fondamental.
- Montrer des usages concrets, notamment sur Instagram.
- Assumer le marketing : plus d'un tiers du budget du projet va à la promotion.
- Aller au contact, sur les salons, au téléphone, en permanence.
- Structurer dès le départ les données que le produit génère : c'est un patrimoine, exploitable demain par l'IA.

Côté modèle économique : un abonnement à 40 € par an et par famille, que des communes peuvent prendre en charge.

![Anicet Bart devant la slide « On ne retient pas un utilisateur. On le fait réussir. »]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/solfy-retention.jpeg' | absolute_url }})

> « On ne retient pas un utilisateur. On le fait réussir. »

### Stéphane Cruchon : le Design Sprint à l'ère de l'IA

Stéphane pratique le Design Sprint depuis 2015, aux côtés de Jake Knapp, son inventeur chez Google Ventures. Plus de
100 entreprises accompagnées en dix ans, de la start-up au grand groupe.

![Les cinq jours du Design Sprint : stratégie (comprendre, sketcher, décider), prototype et tests]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/design-sprint-diamonds.jpeg' | absolute_url }})

Sa question : pourquoi bloquer encore cinq jours quand l'IA génère un prototype en quelques minutes ? Parce qu'un
projet nouveau noyé dans les agendas meurt, et parce que les décisions sont prises par des humains, pas par des agents.

![Slide « Où l'IA apporte de la valeur » : jours 1 à 3 sans IA, jour 4 vibecoding à fond, jour 5 de vrais humains, analyse avec l'IA après]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/design-sprint-where-ai-helps.jpeg' | absolute_url }})

- **Jours 1 à 3, la stratégie** : friction humaine, l'IA dehors. Chacun sketche sa solution sur papier. Ceux qui
  utilisent l'IA arrivent souvent avec des usines à gaz et perdent face à trois post-its clairs.
- **Jour 4, le prototype** : designers et agents posent la base le matin, l'équipe rend le prototype réel l'après-midi,
  avec les vraies données et l'expert métier au micro.
- **Jour 5, les tests** : de vrais humains, non négociable.
- **Après le sprint** : l'IA transcrit et analyse, en complément des grilles remplies par l'équipe.

![Slide « Les jours 1 à 3, c'est du context engineering. Fait par des humains. »]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/design-sprint-context-engineering.jpeg' | absolute_url }})

> « Il faut moins d'une minute pour faire un truc, mais il faut au moins cinq jours pour prendre une vraie décision
> business. »
>
> « Les jours 1 à 3, c'est du context engineering. Fait par des humains. »
>
> « Le design n'est pas mort : il est nécessaire pour décider, et pour croire en la vision. »

Ses exemples : un agent qui analyse les appels du service client et alimente le CRM, prototypé en un jour et lancé en
moins de six mois ; une marque historique renommée deux semaines après un sprint, parce que les tests avaient montré que
le nom posait problème ; une néobanque suisse passée à 800 000 clients. À chaque fois, la valeur émotionnelle du
processus compte : les gens défendent ce qu'ils ont construit ensemble.

### Roger Ingouacka (Petit Bambou) : la vie d'un Product Builder

![Roger Ingouacka sur scène pour « REX : La vie d'un véritable Product Builder ! »]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/petit-bambou-product-builder.jpeg' | absolute_url }})

Roger, développeur devenu Product Builder, travaille depuis deux ans sur la nouvelle verticale de Petit Bambou :
**Mouvement**, sortie en septembre. Le constat : des personnes de 50 ans qui ont mal partout, sans pathologie, juste
après 15 à 20 ans de sédentarité. L'objectif : remettre son corps en mouvement chaque jour, sans injonction à la
performance ni à l'esthétique.

- **De la 2D à la 3D.** Le dessin 2D était trop long à produire. L'équipe passe à la motion capture : un ostéopathe en
  combinaison à capteurs pendant une journée, et des freelances de la région pour les avatars.
- **Une librairie d'environ 250 mouvements**, découpés à la seconde, avec des transitions animées entre les postures.
- **La vision** : générer une séance à la demande. « J'ai mal au dos, génère-moi une séance de 3 minutes. »
- **Le choix de l'avatar** plutôt que la vidéo générée par IA : un personnage qui ne change pas de visage d'une séance à
  l'autre, et de nouveaux mouvements que d'autres professionnels de santé pourront enregistrer demain.

Le tout avec une équipe d'une vingtaine de personnes, sans squads dédiées, et une question très juste de la salle :
comment éviter qu'une IA enchaîne des mouvements dangereux ?

## Les fils rouges de la journée

**1. L'humain garde l'incompressible.** Kiabi l'a mesuré, Stéphane Cruchon l'a mis dans sa méthode : choisir, trancher
et aller voir les gens ne se compressent pas. L'IA prend le reste.

**2. La source de vérité devient le code, et le contexte devient un produit.** Lovable et Éno n'ont plus de design system
dans Figma. Leur design system parle aux agents, et le contexte se construit comme un outil : deuxième cerveau, MCP,
CI, changelog.

**3. La vitesse sans intention donne des produits qui se ressemblent.** Le craft, le goût et la décision redeviennent la
différence.

**4. Builder ne suffit plus.** Anicet Bart l'a dit sans détour : maintenant que tout le monde sait construire, l'enjeu
est d'acquérir et de faire réussir ses utilisateurs.

## Mon ressenti

**Très peu de tech dans la salle.** Je l'ai regretté. À l'heure où l'IA augmente nos compétences et élargit notre champ
d'action, les sujets de cette journée (design system piloté par des agents, CI comme garde-fou, builders qui shippent
dans la codebase) nous concernent directement. Je pense qu'on gagnerait tous à ratisser plus large dans nos veilles
respectives.

**Une organisation au top, pensée comme une expérience** plutôt qu'une simple conférence. Beaucoup d'humour, d'humain,
de légèreté et de simplicité. Exemple parfait : des chaises pas très confortables, mais très bien amenées avec humour,
et des coussins floqués Nord Star Product pour l'occasion.

**Le tote bag d'accueil contenait des bières triples en bouteille.** Moi, c'est mon grand kiff ; ce n'est peut-être
pas le cas de tout le monde.

![Le food truck Barkette devant les briques de la Plaine Images]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/barkette-food-truck.jpeg' | absolute_url }})

_Le déjeuner, signé Barkette._

**Des retrouvailles.** Content d'avoir retrouvé Rémi, que je n'avais pas vu depuis un bail, derrière son nouveau food
truck, Barkette. Merci à Xavier Koma et Teddy Lecaillon, que j'ai apprécié revoir pour l'occasion, et à toute l'équipe
d'organisation.

**De très bons speakers et de très bons talks**, et de vraies discussions avec certains d'entre eux, notamment Anicet
Bart et Roger Ingouacka.

![Le DJ set de Tremolo pour l'after party de l'édition Aurora]({{ '/assets/images/posts/nord-star-product-edition-aurora-2026/after-party-tremolo.jpeg' | absolute_url }})

_L'after party, avec Tremolo aux platines._

**En vidéo**, pour vous faire une idée de l'ambiance : [le retour de Stéphane Cruchon sur
l'événement](https://lnkd.in/p/eFRqN2wP), et [une autre vidéo sympa de la journée](https://lnkd.in/p/eV7VPs9S).

## En résumé

Nord Star Product Aurora a montré des équipes qui utilisent vraiment l'IA, dans des contextes très différents : une
start-up suédoise, une équipe qui merge jusqu'à 150 pull requests par jour, une équipe produit Kiabi, deux CPO de grandes
maisons, un fondateur, un Product Builder. Leur message commun : l'IA accélère tout ce qui est déjà solide, et nous
laisse le choix, la décision et le terrain.

Pour aller plus loin :

- Le [programme complet de l'édition Aurora](https://nordstarproduct.com/lineup).
- Le [retour en vidéo de Stéphane Cruchon](https://lnkd.in/p/eFRqN2wP) sur l'événement, et
  [une autre vidéo de la journée](https://lnkd.in/p/eV7VPs9S).
- Le livre _Sprint_ de Jake Knapp, et _Transformed_ de Marty Cagan, cité pendant la table ronde.

Et vous, vous y étiez ? Quel talk vous a le plus marqué ?

### Sources

- [Nord Star Product, programme de l'édition Aurora](https://nordstarproduct.com/lineup)
- Mes notes, les transcriptions automatiques des talks et mes photos de la journée
