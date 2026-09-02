# Euphoriks Quizzie Store Assets

This directory contains the source-of-truth material used to prepare **Euphoriks Quizzie** for Google Play. Play Console changes themselves are intentionally outside this branch.

## Structure

```text
store-assets/
├── PLAY_STORE_LISTING.md
├── README.md
├── graphics/
│   ├── app-icon-512.svg
│   └── feature-graphic-1024x500.svg
└── screenshots/
    └── README.md
```

A dedicated GitHub Actions workflow renders the SVG graphic sources to Play-compatible PNG files and uploads them as a workflow artifact.

## Required Play graphics

- **App icon:** 512 × 512 PNG/JPEG, ≤1 MB.
- **Feature graphic:** 1024 × 500 PNG/JPEG, ≤15 MB.
- **Phone screenshots:** 2–8 PNG/JPEG images captured from the actual release UI.

## Rules

1. Screenshots must originate from the actual release app, not generated concept UI.
2. Decorative framing/captions must not obscure or materially alter the app UI.
3. Captions must describe functionality available in the submitted release.
4. The feature graphic can be illustrative, but must not imply unavailable features.
5. Keep the existing Android package/application identity unchanged during this rebrand.
6. Review `PLAY_STORE_LISTING.md` and the current privacy policy before every Play submission.

## Brand lockup

- Product: **Quizzie**
- Master brand: **Euphoriks**
- Full display name: **Euphoriks Quizzie**
- Tagline: **Explore • Play • Learn**

The historical `curioverse` repository/technical naming remains where required for continuity; public-facing assets use Euphoriks Quizzie.
