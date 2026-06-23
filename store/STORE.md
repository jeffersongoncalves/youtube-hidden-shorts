# Chrome Web Store listing

Assets and copy used for the Chrome Web Store submission.

## Name (max 75)

YouTube Hidden Shorts

## Summary (max 132)

Hide YouTube Shorts everywhere — feed, search, sidebar, and channel pages. Always on, zero config, no tracking.

## Detailed description

YouTube Hidden Shorts removes Shorts from YouTube so you get back a clean, regular video experience.

It works everywhere Shorts show up:
• Home and subscriptions feed — Shorts shelves are removed
• Search and grid results — individual Shorts are filtered out
• Sidebar (full and mini) — the Shorts nav entry is hidden
• Channel pages — the Shorts tab is removed

Bonus: if you open a Short link, it loads in the normal video player instead of the vertical Shorts UI (youtube.com/shorts/ID → youtube.com/watch?v=ID).

Why you'll like it:
• Always on — no buttons, no setup. Install and it just works.
• Lightweight — pure CSS hiding plus a tiny redirect script. No bloat.
• Private by design — no analytics, no accounts, no network calls. Runs only on youtube.com.
• Open source (MIT).

To turn it off, just disable the extension in chrome://extensions.

Note: YouTube changes its page structure often. If a Short ever slips through, please open an issue on GitHub and it'll be fixed.

## Category

Tools (Productivity → Ferramentas)

## Language

English

## Privacy practices

- **Single purpose:** Hide YouTube Shorts from the YouTube interface — including the feed, search results, sidebar, and channel pages — and redirect Short URLs to the standard video player.
- **Host permission justification (`*.youtube.com`):** Host access to youtube.com is required to inject the CSS and content script that hide Shorts elements on the page and to redirect youtube.com/shorts/ URLs to the normal watch player. The extension runs only on YouTube and makes no external requests.
- **Remote code:** No. All logic ships in the bundled content.js and hide-shorts.css. No eval, no external scripts, no network requests.
- **Data usage:** Does not collect user data.
- **Privacy policy:** https://github.com/jeffersongoncalves/youtube-hidden-shorts/blob/main/PRIVACY.md

## Screenshots (1280×800)

- `screenshot-1-hero.png` — hero / overview
- `screenshot-2-coverage.png` — where Shorts are hidden + URL redirect
- `screenshot-3-privacy.png` — always on, smart redirect, no data collected
