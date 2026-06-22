# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
flutter build ipa --release
## iOS build via GitHub Actions

This repository includes a GitHub Actions workflow that can build an iOS `.ipa` on a macOS runner.

- Workflow path: `.github/workflows/build-ios.yml`
- Trigger: Manual (`workflow_dispatch`) from the Actions tab.

Required repository secrets (set these in Settings → Secrets):

- `APP_STORE_CONNECT_PRIVATE_KEY` — Base64-encoded contents of your App Store Connect `.p8` key (optional; one way to sign builds).
- `APP_STORE_CONNECT_KEY_ID` — Key ID for App Store Connect API key.
- `APP_STORE_CONNECT_ISSUER_ID` — Issuer ID for App Store Connect API key.

Notes:

- Building an `.ipa` still requires valid Apple signing credentials and appropriate provisioning profiles.
- If you need ad-hoc or App Store signing, configure certificates/profiles accordingly or use a service like Fastlane to manage signing.

To run locally on a Mac, use:

```bash
flutter build ipa --release
```

