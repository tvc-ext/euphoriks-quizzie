# Euphoriks Quizzie roadmap

## Phase 0 — Foundation ✅

- Product vision and child-safety rules
- Local-first architecture
- Flutter design system
- Navigation prototype
- Seed content and deterministic demo state

## Phase 1 — Playable learning MVP ✅ / active hardening

- Explorer avatar and broad age-band setup
- Learning-world/topic cards
- Quiz engine with explanations and non-repeating question history
- Brain Arcade / pattern and logic play
- Curiosity energy and local progress
- On-device progress persistence
- Image discovery with optional camera/gallery access and on-device ML labeling
- Public educational lookups with graceful built-in fallback content
- Release validation, signed Android App Bundle and Families-sensitive permission audit

## Phase 1.5 — Euphoriks Quizzie production rebrand 🚧

- Public display branding: Euphoriks Quizzie
- Compact child-facing lockup: Quizzie · by Euphoriks
- New splash/app chrome
- Android display label and launcher branding without changing the existing package/application identity
- Rebranded website, privacy policy, support page and public docs
- Production-ready Play listing copy and graphic sources
- Real-release screenshot generation/checklist
- Closed-test verification of the rebranded AAB before production rollout

## Phase 2 — Creative intelligence

- Guided idea lab
- Safe prompt templates
- Drawing/story/science missions
- AI provider abstraction with explicit child-safety controls
- Non-AI activity fallback
- Parent-visible controls/history where appropriate

## Phase 3 — Private collaboration (requires new architecture decision)

- Parent-mediated invite/consent design
- Fictional identities only
- Small approved circles
- Preset reactions and cooperative challenges
- No unrestricted child chat
- Backend threat model, moderation and consent lifecycle before implementation

The current Explorer Clubhouse is device-only and fictional; it is not a real child-to-child social network.

## Phase 4 — Content operations

- Versioned/signed content packs
- Age-band review workflow
- Educator/parent feedback
- Content quality and bias evaluation
- Any future analytics must be privacy-reviewed and reflected in Play/Data Safety before release

## Current production definition of done

- Rebranded app installs/updates through the existing Google Play application identity.
- `flutter analyze` and `flutter test` pass.
- Release manifest contains only expected permissions and no blocked sensitive permissions.
- Signed AAB is produced from GitHub Actions with secrets kept out of source control.
- Store screenshots represent actual release UI.
- Website/privacy/support copy matches the code and dependencies.
- Core built-in learning remains usable when public-content requests are unavailable; network-enhanced experiences fail gracefully.
