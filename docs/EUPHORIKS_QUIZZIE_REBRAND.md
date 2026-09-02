# Euphoriks Quizzie rebrand

The public-facing brand is **Euphoriks Quizzie** and the GitHub repository is **`tvc-ext/euphoriks-quizzie`**. The Android application/package identity used by the existing Google Play closed test remains unchanged.

## Brand architecture

- Master brand: **Euphoriks**
- Product: **Quizzie**
- Full display/store name: **Euphoriks Quizzie**
- Compact child-facing lockup: **Quizzie · by Euphoriks**
- Positioning line: **Explore • Play • Learn**

## Implemented

### App UI

- Material app title is `Euphoriks Quizzie`.
- App bar uses `Quizzie` with `by Euphoriks`.
- Splash uses the Quizzie/Euphoriks lockup.
- Onboarding says `Welcome to Quizzie!` and `Enter Quizzie`.
- Branding tests cover the current public identity.

### Android release packaging

- Existing generated Android package/application identity remains unchanged.
- Release workflow replaces the generated Android display label with `Euphoriks Quizzie`.
- Release workflow injects the Quizzie launcher drawable.
- Existing `CURIOVERSE_...` signing-secret/variable names remain for credential/configuration continuity.
- Tester APK/AAB artifact display names use `euphoriks-quizzie-*`.
- Families-sensitive merged-manifest audit remains in place.

### Website and privacy

- Landing page, privacy page and support page use Euphoriks Quizzie branding.
- GitHub Pages follows the renamed repository at `https://tvc-ext.github.io/euphoriks-quizzie/`.
- Privacy policy distinguishes public branding from retained release-critical technical identifiers.
- Pages validation checks privacy wording and rejects the former public brand in website content.

### Documentation and repository

- Repository: `tvc-ext/euphoriks-quizzie`.
- README and contributor guidance use the current brand.
- Product vision, architecture, roadmap, public-website notes, Play Families/Data Safety baseline and release guide are aligned to the current name.
- Outdated fully network-free wording was removed; docs distinguish local-first state from public educational network requests.

### Store listing assets

- Final app name, short description, full description, claims guardrails and screenshot plan are documented in `store-assets/PLAY_STORE_LISTING.md`.
- `store-assets/graphics/app-icon-512.svg` is the source for the Play icon.
- `store-assets/graphics/feature-graphic-1024x500.svg` is the source for the Play feature graphic.
- `scripts/render-store-assets.sh` renders exact-size Play-compatible PNG files.
- `.github/workflows/store-assets.yml` renders/validates those assets in CI and publishes them as the `euphoriks-quizzie-play-store-graphics` artifact.
- Phone screenshots remain tied to real release UI.

## Deliberately retained technical identifiers

The following remain unchanged to preserve Google Play update and signing continuity:

- Android package/application ID.
- Dart package name/import prefix (`curioverse`).
- Existing `CURIOVERSE_...` signing-secret/configuration names and upload key.

These are internal compatibility identifiers only. They must not be used as the public product, repository, Pages, artifact, or documentation name.

## Safety and privacy invariants

The branding change does not change the current privacy boundary:

- no ads or analytics SDKs;
- fictional explorer identity rather than child real names;
- local profile/progress storage;
- no public/free-form child-to-child chat;
- camera/gallery only for the existing image-discovery experience;
- on-device ML image labeling from application code;
- external/public educational content may be retrieved over the network;
- privacy and Data Safety claims must describe actual implementation rather than branding intent.

## Next release steps

1. Run a new Android Release with an incremented Play version code.
2. Install/test the rebranded APK on a real device, preferably as an update over the existing test install.
3. Verify local progress survives an update installation.
4. Review/download the generated Play graphic artifact.
5. Review the real UI phone screenshots.
6. Upload the new AAB to the appropriate Play track and update Play Console branding/listing when ready.

## Naming note

This document is an engineering/branding record, not legal trademark clearance. Similar-name and trademark review should be completed before public production launch.
