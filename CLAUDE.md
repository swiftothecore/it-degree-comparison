# IT Degree Comparison

Single HTML file comparing IT degree options, tracked in git instead of
manually-numbered copies. History was backfilled from 7 same-day
`it-degree-comparison-vN.html` drafts on 2026-09-02 — `git log` is a real,
backdated timeline (one commit per draft, timestamped to that draft's file
mtime), not just a migration commit. (v7 was byte-identical to v6 and was
skipped.)

## Files

- `index.html` — the one live, tracked file (named `index.html`, not
  `it-degree-comparison.html`, so GitHub Pages serves it at the repo's root
  URL). Never fork this into `it-degree-comparison-v9.html` etc. — commit
  changes to it directly.
- `update-notes.sh` — run after downloading a fresh export straight into this
  folder (as `it-degree-comparison-vNN.html` or similar). It diffs it against
  the tracked file, commits, pushes to GitHub, and deletes the downloaded
  copy. Aliased as `update-it-notes` in `~/.zshrc`.
- Remote: `origin` → `github.com/swiftothecore/it-degree-comparison` (public,
  so GitHub Pages can serve it — see below).
- GitHub Pages: enable from the `main` branch root in the repo's Settings →
  Pages to serve `index.html` at
  `https://swiftothecore.github.io/it-degree-comparison/`.

## Workflow

- Normal edit: modify `index.html`, then `git add index.html
  && git commit -m "..." && git push`.
- New export downloaded: run `update-notes.sh` (or the `update-it-notes`
  alias) instead of doing it by hand.
- Do not add a `Co-Authored-By: Claude` trailer to commit messages in this
  repo.
