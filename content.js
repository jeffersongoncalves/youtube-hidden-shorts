// Shorts hiding is done entirely by hide-shorts.css (injected at document_start).
// JS only redirects an opened Short to the normal player.
// To disable everything, disable the extension in chrome://extensions.

function redirectShortsWatch() {
  const m = location.pathname.match(/^\/shorts\/([\w-]+)/);
  if (m) {
    location.replace(`${location.origin}/watch?v=${m[1]}`);
  }
}

redirectShortsWatch();

// SPA navigation: YouTube doesn't reload between pages.
window.addEventListener("yt-navigate-finish", redirectShortsWatch);
