# Euphoriks Quizzie Play Families & Data Safety Baseline

This document records implementation facts that must be re-checked before every Google Play submission. It is an engineering checklist, not legal advice.

## Current Play audience baseline

The existing Play Console setup has been prepared for child audiences, including 6–8 and 9–12. Any future audience change must be reviewed against the release content and Families policy before submission.

## Current implementation facts

- No advertising SDK is intentionally included.
- No analytics SDK is intentionally included.
- No Euphoriks cloud account or backend is used by the app.
- Child identity is based on fictional explorer aliases rather than real names.
- Profile choices and progress are stored locally on the device.
- Explorer Clubhouse is device-only and uses fictional crew members; it is not public chat or real user-to-user messaging.
- The picture scanner can use the camera or gallery when the user chooses that experience.
- Image recognition is performed with Google ML Kit image labeling on-device from Quizzie application code.
- Quizzie application code does not upload the selected photo to its educational content service in the current implementation.
- Detected text labels can be sent to Wikipedia to retrieve public educational summaries.
- Other learning experiences can retrieve public educational content such as Wikipedia/NASA resources and public GitHub-hosted content.
- Public rebranding from CurioVerse to Euphoriks Quizzie does not itself add a new data flow.

## Expected Android capabilities

The generated Android release currently requires:

- `android.permission.INTERNET` — public educational-content requests.
- `android.permission.CAMERA` — optional picture-scanner camera capture.
- Camera hardware is declared optional.

Dependencies can merge additional manifest entries. The release workflow therefore validates the merged release manifest and records it as an artifact.

## Play Console consistency matrix

| Play declaration | Engineering baseline |
| --- | --- |
| Ads | No ads |
| App access | No login/restricted account required |
| User-to-user content exchange | No public/free-form exchange |
| Online content | Yes |
| Primary purpose | Education |
| Camera | Optional feature |
| Photo upload by Quizzie app code | No, not in current implementation |
| External educational requests | Yes |
| Local profile/progress storage | Yes |
| Euphoriks cloud child account | No |

## Rebrand continuity

- Public/display name: **Euphoriks Quizzie**.
- Existing repository/Dart package and Android package/application identity may retain the historical `curioverse` technical naming.
- Existing signing-secret names may retain `CURIOVERSE_...` to avoid credential churn.
- The rebrand must not create a new Play application ID unless a separate migration decision is explicitly made.

## Release gate

Before certifying Families compliance or submitting/updating Data Safety:

1. `flutter analyze` passes.
2. `flutter test` passes.
3. Release AAB is built from the intended commit.
4. Merged release manifest audit passes.
5. Review the uploaded `euphoriks-quizzie-merged-release-manifest` artifact for unexpected permissions/components.
6. Re-check `pubspec.yaml` for new SDKs, especially ads, analytics, authentication, location, social, payments or cloud-storage packages.
7. Re-check network destinations in source code.
8. Reconcile the Play Data Safety form with the actual behaviour of every dependency/SDK, including Google ML Kit and platform services.
9. Confirm the published privacy policy matches the release.
10. Confirm store screenshots and feature graphics do not imply unimplemented social, cloud or AI functionality.

A green automated manifest check is evidence for review, not a substitute for the developer's Google Play policy/legal certification.
