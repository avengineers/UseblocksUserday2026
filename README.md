# Our Talk at the useblocks User Day 2026

The slide deck of our talk at the [useblocks user day](https://useblocks.com/company/events),
23 October 2026 in Munich.

The talk: "Advanced Variant Management with Sphinx-Needs".
The slides: <https://avengineers.github.io/UseblocksUserday2026/>.
Add `?print-pdf` to the URL to get the printable version.

The talk follows two earlier ones:
[CodeDays 2024](https://avengineers.github.io/CodeDays2024/) and
[the useblocks user day 2025](https://avengineers.github.io/UseblocksUserday2025/). The demo
project is [SPLED](https://github.com/useblocks/SPLed), as useblocks adapted it to their tools.

## Editing and viewing locally

1. Clone the repository with its submodule:

   ```powershell
   git clone --recurse-submodules https://github.com/avengineers/UseblocksUserday2026.git
   ```

2. Install Node.js and the web server. Run `.\build.ps1 -install`, or use the VS Code task
   `Install dependencies`.
3. Start the web server. Run `npm run dev`, or use the VS Code task `Start local web server`.
4. Open `http://localhost:3000/` in your browser.

Use [Visual Studio Code](https://code.visualstudio.com/) to edit the slides.

On Linux or WSL, open the repository in its dev container instead — with VS Code Dev
Containers or [DevPod](https://devpod.sh/). It installs Node.js, uv and Claude Code, and it
trusts the CA certificates of the host, so it also works behind a corporate proxy. Then
start the web server with `npm run dev`.

## Infrastructure

| Piece | Where |
|---|---|
| reveal.js | `reveal.js/` submodule, upstream, pinned to 6.0.2 |
| Theme | `css/marquardt.css` |
| Shared styles | `css/custom.css` |
| Images | `images/` |
| QR codes | `scripts/make_qr.py` |

The slides are in `index.md`, and `index.html` loads them. The rules for changing the deck
are in [AGENTS.md](AGENTS.md).

## License

[MIT](LICENSE)
