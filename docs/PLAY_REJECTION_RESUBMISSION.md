# Play rejection: validation and resubmission

Package: `com.tvcext.curioverse`. Public name: **Euphoriks Quizzie**.

The October 1, 2026 rejection evidence shows a boy/lightbulb store icon in en-GB and an owl launcher in version 168. The same email thread also rejects an inactive privacy policy URL.

## Repository resolution

- Android release packaging reads the checked-in owl drawable.
- The 512px store icon uses exactly the same paths, colours and viewport.
- CI checks artwork parity and bundled policy parity with the website.
- Onboarding and the explorer profile menu expose the full privacy policy offline.
- Package and existing signing configuration are preserved.

## Required release validation

1. Merge this fix only after Android Release analyze/tests and Store Listing Assets checks pass.
2. Run Android Release on main with an explicit version code greater than every code already uploaded to Play Console. Use 171 only if the highest uploaded code is 170 or lower. Preserve the release version name unless deliberately changing it.
3. Download the signed `euphoriks-quizzie-play-store-aab` and `euphoriks-quizzie-play-store-graphics` artifacts from workflows using the merged commit. Do not reuse build 170: it lacks in-app policy access.
4. Install the AAB through a Play test track. Confirm the code in App bundle explorer, the package, owl icon, full launcher name, Quizzie/by Euphoriks UI, a working quiz and policy access before onboarding and from the explorer menu. Test an update over the existing Play install and confirm saved progress remains.
5. Capture current app screenshots. Review every advertised feature against the tested release; the Friends area is a fictional device-only team, not online chat. Do not claim fully offline operation: public educational content can use the network.

## Manual Play Console actions

1. Store listings: set title to **Euphoriks Quizzie**. Upload `euphoriks-quizzie-app-icon-512.png` to the default listing, en-GB and every translated/custom listing with a separate icon. Remove the boy/lightbulb artwork from all icon overrides.
2. Review each listing's description, screenshots and feature graphic against the same tested release. Use real app captures for screenshots. Listing text is in `store-assets/PLAY_STORE_LISTING.md`.
3. App content → Privacy policy: set `https://tvc-ext.github.io/euphoriks-quizzie/privacy/`. Open signed out on another network and confirm a readable Quizzie policy; do not use the separate Euphoriks Me policy or the old repository URL.
4. Select the validated new AAB in the intended release track, save the release and listing changes, then Publishing overview → Send changes for review. Check both policy items are included in the pending changes.

Repository workflows do not update Play Console or submit reviews. A successful CI build does not establish that device tests or Console changes were completed.
