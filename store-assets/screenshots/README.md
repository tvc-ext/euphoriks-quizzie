# Euphoriks Quizzie phone screenshots

Google Play requires 2–8 phone screenshots. These must show the **actual release UI**. Do not substitute generated/concept UI.

## Recommended capture set

| # | Caption | Actual app surface |
| --- | --- | --- |
| 01 | Welcome to Quizzie | Onboarding with age-band + fictional explorer choice |
| 02 | Pick a Learning World | Home screen with Space, Dinosaurs, AI Lab and Oceans cards |
| 03 | Explore a Learning Adventure | Real Learning Adventure/topic screen |
| 04 | Challenge Your Brain | Brain Arcade or Pattern Game |
| 05 | Quiz, Think, Discover | Real quiz question/answer interaction |
| 06 | Discover with Images | Actual picture-scanner screen if enabled in the release |
| 07 | Meet the Explorer Clubhouse | Current device-only fictional Clubhouse screen; never imply real child messaging |
| 08 | Keep Your Progress Local | Real UI showing curiosity energy/completed progress where visible |

## Capture requirements

- Portrait screenshots are preferred for the current phone UI.
- Play accepts 16:9 or 9:16 with each side between 320 and 3840 px; verify current Play Console requirements before final upload.
- Use the same rebranded AAB intended for the testing/production release.
- Do not include debug banners, developer overlays, test-only controls or personal notifications.
- If decorative captions/frames are added, keep the real UI clearly visible and materially unchanged.

## Rebrand verification visible in screenshots

At least the early screenshots should visibly show one or more of:

- `Quizzie`
- `by Euphoriks`
- `Explore • Play • Learn`

## Do not claim/show

- real child-to-child chat
- cloud account/profile sync
- purchases or subscriptions
- ads
- AI-generated stories/images unless implemented in that release
- unrestricted web browsing
- features that only exist in concept artwork

## Capture workflow

1. Build/install the latest signed or tester APK from the rebrand commit.
2. Reset the explorer profile if onboarding needs to be captured.
3. Capture clean Android screenshots from the real app.
4. Store approved originals in this directory using names such as `01-welcome-to-quizzie.png`.
5. Review every screenshot against `../PLAY_STORE_LISTING.md` and the exact AAB before Play upload.
