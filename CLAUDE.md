# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal [Zola](https://www.getzola.org/) blog for Marco Dalla Stella, deployed to GitHub Pages. No Node toolchain.

## Build & serve

- Local preview: `zola serve` (add `--drafts` to include `draft = true` pages).
- Production build: `zola build` → outputs to `public/` (gitignored).
- CI pins **Zola 0.22.1** (`.github/workflows/zola.yaml`, `ZOLA_VERSION`).

## Styling (two-part SCSS — important)

Zola's built-in Sass compiler (grass) **cannot compile PicoCSS 2.x** (it uses `color.channel()`, unsupported by grass). So styling is split:

- **PicoCSS** is pre-compiled with **dart-sass** into `static/css/pico.min.css`, which is **committed**. The vendored Pico source and the module config live in `scss-src/`. After changing `scss-src/pico-build.scss`, recompile:
  ```
  sass scss-src/pico-build.scss static/css/pico.min.css --style=compressed --no-source-map
  ```
  (`sass` = dart-sass; no Node needed. CI does not rebuild this — commit the result.)
- **Custom styles** live in `sass/main.scss` and are compiled by Zola/grass to `/main.css` on every build. Keep this file free of Pico `@use`/modern color-module functions.

## Templates

- Tera templates in `templates/`: `base.html` (skeleton with `extras`/`main` blocks), `index.html` (home), `section.html` (posts, grouped by year), `post.html` (via `page_template` in `posts/_index.md`), `page.html` (generic, e.g. about-me), `taxonomy_single.html`/`taxonomy_list.html` (tags), `404.html`, partials in `templates/partials/`, and `shortcodes/plotly.html`.
- **URL/`safe` gotcha:** Tera HTML-escapes `/` to `&#x2F;`, and `{{ ... | safe }}` does **not** work inside macros. Pipe URL values (`permalink`, `current_url`, `config`/`extra` URLs, `get_taxonomy_url`) through `| safe` in templates. `get_url(...)` output is already safe.
- Site params live in `[extra]` in `config.toml` (author, mastodon, `menu`, `social`); read as `config.extra.*`.
- Plotly: a post using `{{/* plotly(json="...", height="...") */}}` must set `extra.plotly = true` so the library loads.

## Content

- Posts in `content/posts/` as `week_NN.md`. Front matter is **TOML** (`+++`): `title`, `date`, `[taxonomies] tags`, optional `[extra] song`.
- `[slugify] paths = "safe"` in `config.toml` preserves underscores in URLs (e.g. `/posts/week_39/`) — do not remove it or existing links break.
- Image-heavy posts use page bundles (`name/index.md` with colocated assets), e.g. `content/posts/up_to_week_43/`.
