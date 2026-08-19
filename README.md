# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## External dependencies

- **lazygit** — git integration (`<leader>gg`)
- **ripgrep** — text search in the picker
- **fd** — file search in the picker
- **a C compiler** (gcc/clang) — needed by nvim-treesitter to build parsers
- **curl** — used by `md-render.nvim` for downloading images/video from URLs
- **ffmpeg** / **ImageMagick** — used by `md-render.nvim` for image/video conversion
- **mermaid-cli** (`mmdc`) — used by `md-render.nvim` for rendering Mermaid diagrams (falls back to `npx -y @mermaid-js/mermaid-cli`)
- a terminal with Kitty graphics protocol support (e.g. Kitty) — needed by `md-render.nvim` for markdown preview
