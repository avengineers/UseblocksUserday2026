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
  use `images/speaker_placeholder.svg` and the first name without a link.

**Caution:** the history goes public with the files. A text that you change or delete stays
readable in the older commits.

Before you make the repository public:

1. Check every file against the rules above.
2. Check every commit message against the rules above.
3. Set the visibility of the repository to public.
4. Switch on GitHub Pages for the `develop` branch and the root folder.
5. Open `https://avengineers.github.io/UseblocksUserday2026/`.

## Structure

```text
UseblocksUserday2026/
├── .devcontainer/             dev container for Linux and WSL, also behind a corporate proxy
├── index.html                 reveal.js entry point of the deck
├── index.md                   the slides
├── images/                    logos, speaker photos, the QR code, figures
├── css/
│   ├── marquardt.css          the theme
│   └── custom.css             shared styles, including the common slides
├── reveal.js/                 submodule: upstream reveal.js, pinned to 6.0.2
└── scripts/
    ├── postCreate.sh          sets up the dev container after it is created
    └── make_qr.py             makes the QR codes
```

This repository holds one deck and stays that way: "Advanced Variant Management with
Sphinx-Needs", in English, by Judith, Karsten and Philip. Do not add a landing page or a
second deck.

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

The deck has one column per chapter. The horizontal separator `---` starts a chapter, and the
vertical separator `--` adds a slide below it. The "Agenda" slide names each chapter and its
speaker, so the speaker changes only between two columns.

- Start each chapter with a title slide: the chapter name as a `##` heading, the same as in the
  agenda, and the speaker below it.
- Put a slide that can be cut last in its column. A speaker who runs out of time presses
  Right and skips the rest of the column.
- Write a slide heading in title case, as a section heading of a document: capitalize each
  major word, and keep articles, short conjunctions and short prepositions in lower case,
  except as the first or the last word. Example: "Whole Components In or Out".
- Write a bullet as a short phrase, not as a sentence. A phrase has no full stop. Where a line
  on a slide is a full sentence, it ends with a full stop. The speaker notes are full sentences.
- Do not announce what is new before the chapter that shows it.
- Make each bullet appear on its own click: end its line with
  `<!-- .element: class="fragment" -->`. On a line with inline code or a link, the Markdown
  plugin gives that class to the code or the link. The `FragmentToLine` plugin in `index.html`
  moves it to the line. Keep that plugin right after `RevealMarkdown`.
- Keep each slide's speaker in its notes, as `(Name)` at the start.
- Write the speaker notes in full sentences. A speaker who reads them must be able to give
  the slide.

## The common slides

The deck starts with the title slide and "Who Are We?". It ends with "Questions?" and
"Some Links".

- Change their look in `css/custom.css`, section "The common slides". Do not change it with
  inline styles in `index.md`.

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

- Run `npm install` once. Then run `npm run dev`.
- Run `npm run lint:md` before each commit.
- Run `uv run scripts/make_qr.py` after a change of the deck URL. It writes `images/qr.png`.
- While the repository is private, `npm run dev` is the only way to see the deck. It opens at
  `http://localhost:3000/`.
- When the repository is public, GitHub Pages serves the `develop` branch from the root
  folder, at `https://avengineers.github.io/UseblocksUserday2026/`. The QR code and the
  "Some Links" slide point there.
- Keep the empty file `.nojekyll`. With it, GitHub Pages serves the files as they are, without
  a Jekyll build.

## Language

- The deck is in English.
- `AGENTS.md`, `README.md`, code comments and commit messages are in English.

## Commits

Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`.
