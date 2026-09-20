# Gamer Hub — APK Builder

This repository builds the Gamer Hub Android APK automatically.

## Phone-only steps
1. Create a GitHub repository.
2. Upload all files from this folder, including `.github/workflows/build-apk.yml`.
3. Open the repository → Actions.
4. Select **Build Gamer Hub APK**.
5. Tap **Run workflow**.
6. When it finishes, open the workflow run and download the `gamer-hub-apk` artifact.
7. Extract it and install `app-release.apk`.

The workflow creates the missing Android build files automatically, so you do not need Android Studio on your phone.
