# Package Tracking App

A Flutter app to track packages, the mobile equivalent of [my package tracking site](https://github.com/JayCowan/package-tracker-web).

## Getting Started

A Firebase project must be set up to go along with the app, including adding a `GoogleService-Info.plist` file added to `./ios/` and `google-services.json` added to `./android/`. For web support, create a file `./web/firebaseconfig.js` and add your project's Firebase configuration.
The following must be enabled:
* Auth
* Analytics
* Database
* Anything mentioned in the accompanying projects.

## Building/Running
Run the following to build for iOS: `flutter build ios`
Run the following to build an Android App Bundle: `flutter build appbundle`
Run the following to biuld an Android APK: `flutter build apk`
Web is not actively supported yet, but to build web run the following: `flutter build web`

With an emulator active, run the following to test: `flutter run`