# Flutter Review App

Flutter Review App is mobile application that is used for demonstration purposes.

## Tech

Flutter Review App is written in Flutter (SDK 3.10.6) and uses number of open source libraries to work properly:

- [cupertino_icons] - app icons
- [get] - state management, DI, route management
- [pull_to_refresh] - flutter scroll component drop-down refresh and pull up load support
- [dio] - HTTP client
- [flutter_dotenv] - handling enviroment or configuration
- [intl] - localization facilities
- [json_annotation] - JSON serialization and deserialization

## Installation

Flutter Review App requires [Flutter SDK 3.10.6](https://docs.flutter.dev/release/archive?tab=macos) to run. Then follow these commands:

```sh
cd review_flutter-main
flutter pub get
flutter run
```

## Apk (Android)

To make testing this mobile app easier, the `app-release.apk` file is located in the `/apk/release` folder.

## Tests

To run tests (unit & widgets) follow these commands:

```sh
cd review_flutter-main
flutter test
```

[cupertino_icons]: https://pub.dev/packages/cupertino_icons
[get]: https://pub.dev/packages/get
[pull_to_refresh]: https://pub.dev/documentation/pull_to_refresh/latest/
[dio]: https://pub.dev/packages/dio
[flutter_dotenv]: https://pub.dev/packages/flutter_dotenv
[intl]: https://pub.dev/packages/intl
[json_annotation]: https://pub.dev/packages/json_annotation
