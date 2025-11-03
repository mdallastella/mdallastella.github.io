# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for Marco Dalla Stella's personal blog and portfolio. The site is built with Hugo and includes Squint ClojureScript compilation for interactive JavaScript functionality.

## Architecture

### Static Site Generator
- **Hugo**: Main static site generator (configured in `hugo.yaml`)
- **Content**: Stored in `content/` directory using Org-mode format (`.org` files)
- **Layouts**: Custom Hugo templates in `layouts/` directory
- **Static Assets**: Images, fonts, and compiled JS in `static/`

### Frontend Technologies
- **CSS**: PicoCSS framework with custom theming (jade theme) in `assets/scss/main.scss`
- **JavaScript**: Squint ClojureScript compilation
  - Source: `assets/cljs/hello.cljs`
  - Compiled output: `static/js/hello.mjs`
  - Configuration: `squint.edn`

### Content Structure
- Blog posts in `content/posts/` as Org-mode files
- About page in `content/about-me/index.org`
- Homepage content in `content/_index.org`

## Development Commands

### Hugo Development
```bash
# Start development server
hugo server -D

# Build production site
hugo

# Clean build cache
hugo --gc
```

### CSS/PostCSS
```bash
# Process CSS with PostCSS (using config from package.json)
npx postcss assets/scss/main.scss -o static/css/main.css
```

### ClojureScript Compilation
```bash
# Compile ClojureScript to JavaScript using Squint
npx squint compile
```

### Install Dependencies
```bash
# Install Node.js dependencies
npm install
```

## Key Configuration Files

- `hugo.yaml`: Hugo site configuration, menus, and parameters
- `package.json`: Node.js dependencies and build scripts
- `squint.edn`: Squint ClojureScript compilation configuration
- `assets/scss/main.scss`: PicoCSS customization and site styles

## Content Workflow

1. Create new posts as Org-mode files in `content/posts/`
2. Use Hugo front matter in YAML format at the top of each `.org` file
3. Run `hugo server -D` for development with draft posts
4. Build with `hugo` for production deployment

## Styling System

The site uses PicoCSS with:
- Custom jade theme color
- Iosevka monospace font
- Responsive grid layout for profile section
- Custom CSS variables prefixed with `--m-`

## ClojureScript Integration

Squint compiles ClojureScript files from `assets/cljs/` to JavaScript in `static/js/`. The compiled output can be included in Hugo templates or layouts.