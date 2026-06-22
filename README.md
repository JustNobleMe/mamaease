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

This repository includes a GitHub Actions workflow that can build an iOS `.ipa` on a macOS runner using Fastlane for automatic code signing.

- Workflow path: `.github/workflows/build-ios.yml`
- Trigger: Manual (`workflow_dispatch`) from the Actions tab.

**To enable iOS builds, set these repository secrets** (Settings → Secrets and variables → Actions):

| Secret | Description |
|--------|-------------|
| `APPLE_ID` | Your Apple ID email |
| `APPLE_PASSWORD` | Your Apple ID password |
| `APPLE_APP_SPECIFIC_PASSWORD` | App-specific password from appleid.apple.com |
| `APPLE_TEAM_ID` | Your Apple Developer Team ID (e.g., `ABC123DEF4`) |
| `APPLE_ITC_TEAM_ID` | App Store Connect Team ID (often same as `APPLE_TEAM_ID`) |

**How to get these values:**
1. Apple ID: Your iCloud/Apple Developer account email
2. App-specific password: Generate at https://appleid.apple.com/account/manage (requires 2FA)
3. Team ID: Found in Apple Developer account → Membership

**Notes:**
- Fastlane will attempt to auto-provision certificates and profiles
- This workflow uses App Store signing method
- For local builds on macOS, use: `flutter build ipa --release`

