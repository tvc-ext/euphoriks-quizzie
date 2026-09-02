# Euphoriks Quizzie — Google Play Store Listing Pack

> Production preparation source of truth. Play Console itself is intentionally out of scope for this branch. Do not advertise aspirational features that are not present in the release AAB.

## App identity

- **App name:** Euphoriks Quizzie
- **Compact in-app lockup:** Quizzie · by Euphoriks
- **Tagline:** Explore • Play • Learn
- **Category:** Education
- **Website:** https://tvc-ext.github.io/curioverse/
- **Privacy policy:** https://tvc-ext.github.io/curioverse/privacy/
- **Support:** https://tvc-ext.github.io/curioverse/support/
- **Technical continuity:** existing Android package/application identity remains unchanged

## Final short description

Fun learning worlds, quizzes and discovery games for curious kids.

## Final full description

**Euphoriks Quizzie** is a colourful learning adventure for curious kids who enjoy exploring, solving and discovering through play.

Travel through bite-sized learning experiences, take on quizzes and brain challenges, explore visual topics and build curiosity across science, history and the world around us.

### Explore learning worlds

Discover playful learning experiences covering topics such as space, dinosaurs, oceans, AI concepts, history, animals and more.

### Challenge your brain

Take on quizzes, patterns, logic missions and quick challenges that encourage observation, reasoning and problem solving.

### Discover with images

Quizzie includes an optional picture-scanner experience. Image labeling runs on-device in the current implementation, and a detected label can be used to request a public educational summary.

### Progress through play

Completed activities and curiosity energy are kept locally on the device so children can see their learning journey grow.

### Built with children in mind

Quizzie uses fictional explorer aliases instead of requiring a child's real name. Current profile choices and progress are stored locally on the device. The current release has no advertising or analytics trackers and does not require an Euphoriks cloud account.

Some learning experiences retrieve public educational information from external services. See the Euphoriks Quizzie Privacy Policy for precise current behaviour.

**Explore • Play • Learn**

## Screenshot plan

Only screenshots rendered/captured from the release app may be submitted as phone screenshots. Decorative captions may be added around real UI if they do not obscure or materially alter it.

Recommended truthful sequence:

1. **Welcome to Quizzie** — onboarding / fictional explorer setup
2. **Pick a Learning World** — home learning worlds
3. **Explore a Learning Adventure** — topic/adventure screen
4. **Challenge Your Brain** — Brain Arcade or pattern challenge
5. **Quiz, Think, Discover** — real quiz interaction
6. **Discover with Images** — actual picture-scanner screen, if included in the submitted release
7. **Explorer Clubhouse** — only with caption clearly describing the current device-only fictional team experience
8. **Keep Your Progress Local** — actual progress/energy UI available in the release

Do not use generated concept UI or claim real child-to-child networking, cloud sync, AI generation, purchases, or functionality absent from the submitted build.

## Feature graphic

Required output: **1024 × 500 PNG/JPEG**.

Source in this repository: `graphics/feature-graphic-1024x500.svg`.

Visual rules:

- Euphoriks Quizzie brand lockup
- purple/indigo learning-universe aesthetic
- tagline: **Explore • Play • Learn**
- decorative educational motifs only
- no fake phone UI
- no claims that cannot be demonstrated in the release

## App icon

Required output: **512 × 512 PNG/JPEG**, ≤1 MB for Play listing.

Source in this repository: `graphics/app-icon-512.svg`.

The icon uses the new Quizzie identity rather than the historical CurioVerse logo. The Android release workflow also injects a rebranded launcher drawable while preserving the existing application identity.

## Store asset generation

Run the dedicated **Store Listing Assets** GitHub Actions workflow or use `scripts/render-store-assets.sh` on a Linux machine with `librsvg2-bin` installed.

Expected generated files:

- `euphoriks-quizzie-app-icon-512.png`
- `euphoriks-quizzie-feature-graphic-1024x500.png`

Phone screenshots are intentionally generated from real Flutter UI separately; concept/mock UI is not accepted as the source of truth.

## Claims guardrail

Avoid absolute or unverified claims such as:

- "100% child-safe"
- "fully offline" or "works offline everywhere"
- "private friends" or real-time child social functionality
- claims that no third-party network data is transmitted
- features shown only in concept artwork
- AI-generated content claims not implemented in the submitted release

## Pre-production checklist

- [ ] Rebrand PR merged with green checks
- [ ] New signed AAB built with a version code greater than the current Play upload
- [ ] Existing package/application identity verified unchanged
- [ ] Launcher label displays **Euphoriks Quizzie**
- [ ] Splash displays **Quizzie · by Euphoriks**
- [ ] 512 × 512 app icon rendered and reviewed
- [ ] 1024 × 500 feature graphic rendered and reviewed
- [ ] 2–8 phone screenshots captured from actual release UI
- [ ] Store listing text reviewed against current build
- [ ] Privacy/support website deployed with Euphoriks Quizzie branding
- [ ] Merged release manifest audit reviewed
- [ ] Real-device update smoke test performed
- [ ] Play Console changes performed only after the repository/release is approved

## Rebranded release notes draft

Meet **Euphoriks Quizzie** — the next chapter of the learning app previously known as CurioVerse. Explore learning worlds, brain challenges, quizzes and visual discoveries with refreshed Quizzie branding while keeping the same app update path and local learning progress.
