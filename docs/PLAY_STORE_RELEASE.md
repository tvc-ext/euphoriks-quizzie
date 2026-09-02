# Euphoriks Quizzie Play Store Release

This repository builds Android release artifacts for the existing Google Play application identity while exposing the public display brand **Euphoriks Quizzie**.

Current non-PR workflow artifacts:

- `euphoriks-quizzie-latest.apk` — direct tester installation artifact.
- `euphoriks-quizzie-play-store.aab` — signed Google Play upload artifact when signing secrets are configured.
- `quizzie-merged-release-manifest.xml` — merged-manifest evidence used by the Families-sensitive permission audit.

The Android package/application identity remains the existing historical identity so the current Play closed-test history and update path are preserved. Rebranding must not silently create a new app ID.

## Required GitHub Secrets

The signing-secret names intentionally retain their historical `CURIOVERSE_` prefix so existing credentials do not need to be recreated:

| Secret | Purpose |
| --- | --- |
| `CURIOVERSE_UPLOAD_KEYSTORE_BASE64` | Base64-encoded Android upload keystore file. |
| `CURIOVERSE_UPLOAD_KEYSTORE_PASSWORD` | Store password for the upload keystore. |
| `CURIOVERSE_UPLOAD_KEY_ALIAS` | Key alias inside the upload keystore. |
| `CURIOVERSE_UPLOAD_KEY_PASSWORD` | Password for the upload key alias. |

Do not commit the keystore, passwords, generated `android/key.properties`, or decoded `.jks` file. The workflow decodes the keystore only inside the GitHub Actions runner.

## Existing upload key

Continue using the existing upload keystore/key that is already associated with the Play application. Do **not** generate a new key merely because the public brand changed.

If a new key ever has to be created for a separate application, use a trusted local machine and follow Google Play's current upload-key process. That is not part of this rebrand.

## Versioning

Android uses two release values:

| Value | Meaning | Rule |
| --- | --- | --- |
| Version name | User-facing version, for example `1.1.0`. | Can follow semantic versioning. |
| Version code | Internal integer submitted to Play Store. | Must increase for every Play Store upload. |

The workflow accepts both through `workflow_dispatch` inputs:

- `release_version`
- `version_code`

For normal push builds, the workflow uses `vars.CURIOVERSE_RELEASE_VERSION` when present, otherwise `1.0.0`, and uses the GitHub run number as the build/version code.

The variable name also intentionally retains `CURIOVERSE_` for configuration continuity.

## Release procedure for the rebrand

1. Confirm the feature branch/PR checks pass:
   - `flutter analyze`
   - `flutter test`
   - merged Android manifest audit
   - GitHub Pages/static privacy validation when site files change

2. Review the public-facing brand in code and website:
   - display name: **Euphoriks Quizzie**
   - in-app compact lockup: **Quizzie · by Euphoriks**
   - tagline: **Explore • Play • Learn**
   - privacy/support copy matches current implementation

3. Merge only after review and green checks.

4. In GitHub **Actions**, manually run **Android Release** with:
   - `release_version`: the intended release version, for example `1.1.0`
   - `version_code`: an integer greater than the last Play Console upload

5. Wait for the workflow to finish successfully.

6. Download the workflow artifacts:
   - `euphoriks-quizzie-tester-apk`
   - `euphoriks-quizzie-play-store-aab`
   - `euphoriks-quizzie-merged-release-manifest`

7. Install/test the APK on a real Android device and verify:
   - launcher label is **Euphoriks Quizzie**
   - launcher icon is the Quizzie rebrand icon
   - splash shows **Quizzie · by Euphoriks**
   - existing local profile/progress still behaves correctly across an update install
   - camera/image discovery works only when invoked
   - network-enhanced content fails gracefully when unavailable

8. Use the signed `euphoriks-quizzie-play-store.aab` for the next Play testing/production release when you are ready to change Play Console content.

9. Keep the existing upload keystore backed up securely. Losing it can block future app updates.

## Rebrand safety notes

- Public display branding changes; package/application identity does not.
- Signing credentials are unchanged.
- The app does not gain a backend, account system, ads, analytics, public chat or new permissions because of the rebrand.
- Store screenshots must show actual release UI.
- Marketing graphics may be decorative but must not imply features absent from the release.
