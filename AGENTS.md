# Euphoriks Quizzie contributor guidance

## Mission

Build a safe, delightful, local-first mobile learning adventure for children. Prefer short visual interactions, discovery, creativity, and replayable challenges over passive feeds.

Public product branding is **Euphoriks Quizzie** (short child-facing name: **Quizzie**, master brand: **Euphoriks**). Historical technical identifiers such as the repository slug, Dart package name, Android package/application identity, and signing-secret names may retain `curioverse` for release continuity.

## Non-negotiable safety rules

- Never request or expose a child's real name, exact age, school, phone number, email, precise location, or photograph as identity data.
- Use fictional explorer aliases and broad age bands.
- Do not add public/free-form child chat, public profiles, or searchable child handles.
- Do not add ads, purchases, streak pressure, dark patterns, or behavioural trackers.
- Keep profile and progress data on-device unless an explicit architecture and privacy decision changes that boundary.
- Camera/gallery access must remain optional and limited to the image-discovery experience.
- Treat on-device ML labels as guesses; do not present them as authoritative identification.
- External educational content and network destinations must be documented in the privacy policy before release.

## Engineering conventions

- Flutter/Dart; Material 3.
- Organize by feature as the prototype grows.
- Keep domain logic separate from widgets.
- Add tests for quiz scoring, age-band filtering, safety controls, and public branding.
- Prefer immutable models and deterministic local fixtures.
- Preserve the existing Android package/application identity while the current Google Play listing and closed-test update path depend on it.
- Run `flutter analyze` and `flutter test` before publishing.

## Branding conventions

- Play/display name: **Euphoriks Quizzie**.
- In-app compact lockup: **Quizzie · by Euphoriks**.
- Tagline: **Explore • Play • Learn**.
- Store screenshots must show actual release UI, not concept-only features.
- Privacy/safety claims must describe actual code and dependencies rather than marketing intent.
