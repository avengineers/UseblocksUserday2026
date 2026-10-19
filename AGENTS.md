# Agent rules — UseblocksUserday2026

This repository holds the slide deck of our talk at the useblocks user day, 23 October 2026 in
Munich. The [README](README.md) explains the repository for human readers. This file holds
the rules an agent gets wrong without them.

## This repository goes public

The repository is private until the speakers call the deck finished. Then it goes public,
and GitHub Pages serves the deck. From that day, everyone can read every file, every commit
message and every speaker note.

Write every file and every commit message as if the repository were public today:

- Do not write internal hostnames, internal repository URLs, credentials or customer names.
  This applies to text, images, code listings, speaker notes and commit messages.
- Do not write Jira keys. A reader outside the company cannot open them.
- Check each slide that comes from an internal deck against these rules before you add it.
- Add a speaker's photo and profile link only when that speaker supplies them. Until then,
  use `docs/images/speaker_placeholder.svg` and the first name without a link.

**Caution:** the history goes public with the files. A text that you change or delete stays
readable in the older commits.

Before you make the repository public:

1. Check every file against the rules above.
2. Check every commit message against the rules above.
3. Set the visibility of the repository to public.
4. Switch on GitHub Pages for the `develop` branch and the root folder.
5. Open `https://avengineers.github.io/UseblocksUserday2026/` and the deck.

## Structure

```text
UseblocksUserday2026/
├── .devcontainer/             dev container for Linux and WSL, also behind a corporate proxy
├── index.html, index.md       landing page: links to the deck
├── docs/
│   ├── _template/             skeleton deck with the common slides
│   ├── variant_management/
│   │   ├── index.html         reveal.js entry point of the deck
│   │   └── index.md           the slides
│   └── images/                logos, speaker photos, QR codes, figures
├── css/
│   ├── marquardt.css          the theme
│   └── custom.css             shared styles, including the common slides
├── reveal.js/                 submodule: upstream reveal.js, pinned to 6.0.2
└── scripts/
    ├── postCreate.sh          sets up the dev container after it is created
    └── make_qr.py             makes the QR codes
```

| Deck | Talk | Language | Speakers |
|---|---|---|---|
| `docs/variant_management/` | Advanced Variant Management with Sphinx-Needs | English | Judith, Karsten, Philip |

## The talk

A 30-minute talk: about 25 minutes of slides and 5 minutes of questions. It follows two
earlier talks, [CodeDays 2024](https://github.com/avengineers/CodeDays2024) and the
[useblocks user day 2025](https://github.com/avengineers/UseblocksUserday2025). Do not repeat
their slides on the SWE.3 and SWE.4 traceability chain. Both talks showed them.

The talk is technical: traceability, variability, the documentation per variant and
shift-left. The rollout of the platform in a company is out of scope.

The demo project is [SPLED as useblocks adapted it](https://github.com/useblocks/SPLed).
Take code listings from its `develop` branch, and name the file each listing comes from in
the speaker notes.

- Keep each slide's speaker in its notes, as `(Name)` at the start.
- Write the speaker notes in full sentences. A speaker who reads them must be able to give
  the slide.

## The common slides

The deck starts with the title slide and "Who are we?". It ends with "Questions?" and
"Some Links".

- Take the markup from `docs/_template/index.md`.
- Change the look in `css/custom.css`, section "Common slides". Do not change it in the deck.

## The theme

`css/marquardt.css` is a copy of the Marquardt reveal.js theme: the League theme with the
Marquardt gradient. It is the same file as in the ESE-2026 repository.

- Do not edit `css/marquardt.css`. Put a change in `css/custom.css`.
- When you move the `reveal.js` submodule to a new tag, open the deck and check the look.
- Do not use cream or off-white backgrounds, numbered section labels such as "01" or "02",
  monospace labels, or pill-shaped buttons.

## Diagrams

Write a diagram in Mermaid inside the slide: a `<div class="mermaid">` with a `<pre>` block
inside, which holds the diagram. The deck loads the Mermaid plugin from a CDN.

**Caution:** without a network, the plugin does not load and the deck does not start. Before
the talk, export the PDF and keep it as the fallback.

## Viewing and checking

- Run `npm install` once. Then run `npm run dev`. The landing page opens at
  `http://localhost:3000/`.
- Run `npm run lint:md` before each commit.
- Run `uv run scripts/make_qr.py` after a change of the deck URL.
- While the repository is private, `npm run dev` is the only way to see the deck.
- When the repository is public, GitHub Pages serves the `develop` branch from the root
  folder, at `https://avengineers.github.io/UseblocksUserday2026/`. The QR code and the
  "Some Links" slide point there.
- Keep the empty file `.nojekyll`. Without it, GitHub Pages does not publish folders that
  start with `_`, such as `docs/_template/`.

## Language

- The deck is in English.
- `AGENTS.md`, `README.md`, code comments and commit messages are in English.

## Commits

Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`.
