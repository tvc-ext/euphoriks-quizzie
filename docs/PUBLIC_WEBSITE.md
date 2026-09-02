# Euphoriks Quizzie public website

The static public website lives in `site/` and is designed for GitHub Pages.

## Public URLs

The repository currently retains its historical `curioverse` slug, so the live URLs remain:

- Website: `https://tvc-ext.github.io/curioverse/`
- Privacy policy: `https://tvc-ext.github.io/curioverse/privacy/`
- Support: `https://tvc-ext.github.io/curioverse/support/`

The pages themselves use the public product brand **Euphoriks Quizzie**. Keeping the existing URLs during the rebrand avoids breaking the privacy-policy URL and other links already configured outside the repository.

## Static-site constraints

The site intentionally has:

- No JavaScript.
- No forms.
- No analytics.
- No cookies.
- No trackers.
- No backend.

The Pages workflow validates these constraints on pull requests and before deployment.

## Privacy-source notes

Privacy claims are based on the current Flutter implementation and must be rechecked before each production release:

- `AGENTS.md`: child-safety rules require fictional aliases, broad age bands, local-first profile/progress state and no ads/dark patterns.
- `pubspec.yaml`: current dependencies include Shared Preferences, HTTP, image picker and Google ML Kit image labeling; no ad or analytics dependency is present.
- `lib/data/profile_store.dart`: age band and avatar ID are stored locally with Shared Preferences.
- `lib/data/progress_store.dart`: curiosity energy and completed topic IDs are stored locally with Shared Preferences.
- `lib/data/open_knowledge_service.dart`: public Wikipedia and NASA educational content is requested and cached locally where implemented.
- `lib/data/question_banks.dart`: public GitHub-hosted question packs can be requested/cached and question history is stored locally.
- `lib/screens/animal_scanner_screen.dart`: camera/gallery selection uses `image_picker`; labeling uses Google ML Kit on device; detected label text can be sent to Wikipedia for a summary.
- `lib/models/child_profile.dart`: identity uses a broad age band and fictional explorer avatar/alias.
- `lib/screens/friends_clubhouse_screen.dart`: the current Clubhouse is device-only and fictional, not public child-to-child messaging.

## Rebrand rule

A name/visual rebrand must not be used to imply a privacy change. If accounts, cloud sync, analytics, advertising, real friend connections, public sharing or new SDK/network flows are introduced later, update the implementation review, privacy policy, Play declarations and this document before release.
