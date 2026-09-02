# Euphoriks Quizzie rebrand

This branch implements the public-facing rebrand from **CurioVerse** to **Euphoriks Quizzie** without changing the Android application/package identity used by the existing Google Play closed test.

## Brand architecture

- Master brand: **Euphoriks**
- Product: **Quizzie**
- Full display/store name: **Euphoriks Quizzie**
- Compact child-facing lockup: **Quizzie · by Euphoriks**
- Positioning line: **Explore • Play • Learn**

## Implemented in this branch

### App UI

- Material app title changed to `Euphoriks Quizzie`.
- App bar uses `Quizzie` with `by Euphoriks`.
- Splash uses the new Quizzie/Euphoriks lockup and removes the historical logo asset dependency.
- Onboarding says `Welcome to Quizzie!` and `Enter Quizzie`.
- Branding tests were updated.

### Android release packaging

- Existing generated Android package/application identity remains unchanged.
- Release workflow replaces the generated Android display label with `Euphoriks Quizzie`.
- Release workflow injects a new Quizzie launcher drawable.
- Existing `CURIOVERSE_...` signing-secret/variable names remain for credential/configuration continuity.
- Tester APK/AAB artifact display names use `euphoriks-quizzie-*`.
- Families-sensitive merged-manifest audit remains in place.

### Website and privacy

- Landing page, privacy page and support page use Euphoriks Quizzie branding.
- Existing GitHub Pages URL remains under `/curioverse/` so configured links are not broken during the rebrand.
- Privacy policy explicitly records the historical-name/technical-identifier continuity and confirms that the rebrand itself adds no new data flow.
- Pages validation checks the new privacy wording and public brand.

### Documentation

- README and contributor guidance use the new brand.
- Product vision, architecture, roadmap, public-website notes, Play Families/Data Safety baseline and release guide are rebranded/refreshed.
- Outdated claims such as a fully network-free prototype were removed; the docs distinguish local-first state from public educational network requests.

### Store listing assets

- Final app name, short description, full description, claims guardrails and screenshot plan are documented in `store-assets/PLAY_STORE_LISTING.md`.
- `store-assets/graphics/app-icon-512.svg` is the source for the Play icon.
- `store-assets/graphics/feature-graphic-1024x500.svg` is the source for the Play feature graphic.
- `scripts/render-store-assets.sh` renders exact-size Play-compatible PNG files.
- `.github/workflows/store-assets.yml` renders/validates those assets in CI and publishes them as the `euphoriks-quizzie-play-store-graphics` artifact.
- Phone screenshots remain deliberately tied to real release UI. `store-assets/screenshots/README.md` defines the capture set instead of committing fake concept screens.

## Deliberately unchanged

The following are intentionally **not** renamed in this branch:

- Google Play Console app/listing itself.
- Android package/application ID.
- Dart package name/import prefix (`curioverse`).
- GitHub repository slug (`tvc-ext/curioverse`).
- GitHub Pages path (`/curioverse/`).
- Existing signing-secret names and upload key.

These technical identifiers are retained to preserve Play update continuity and avoid breaking existing configured URLs/credentials. They can be reconsidered separately only with an explicit migration plan.

## Safety and privacy invariants

The rebrand does not change the current privacy boundary:

- no ads or analytics SDKs;
- fictional explorer identity rather than child real names;
- local profile/progress storage;
- no public/free-form child-to-child chat;
- camera/gallery only for the existing image-discovery experience;
- on-device ML image labeling from application code;
- external/public educational content may be retrieved over the network;
- privacy and Data Safety claims must describe actual implementation rather than branding intent.

## Validation before merge

- Android release PR workflow must pass `flutter analyze`, `flutter test`, and merged-manifest audit.
- GitHub Pages validation must pass.
- Store Listing Assets workflow must render 512×512 and 1024×500 PNGs inside Play size limits.
- Review the rebranded UI and the generated graphics before merging.

## After merge, before changing Play Console

1. Run a new Android Release with an incremented Play version code.
2. Install/test the rebranded APK on a real device, preferably as an update over the existing test install.
3. Verify local progress survives an update installation.
4. Review/download the generated Play graphic artifact.
5. Capture real phone screenshots from the rebranded build.
6. Upload the new AAB to the appropriate Play track and update Play Console branding/listing only when ready.

## Naming note

This document is an engineering/branding record, not legal trademark clearance. Similar-name and trademark review should be completed before public production launch.
