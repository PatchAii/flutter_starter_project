# Flutter starter project 🚦 📱 💻 🖥️

[![style: ficcanaso](https://img.shields.io/badge/style-ficcanaso-yellow)](https://github.com/dbbd59/ficcanaso)

## Introduction

> a template with best practices for starting a new app or becoming familiar with the architecture of our projects

Live Demo: <https://patchaii.github.io/flutter_starter_project/>

---

## Tools

- VSCode (<https://code.visualstudio.com/download>).
- VSCode Extensions
  - Flutter (<https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter>)
  - Dart (<https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code>)
  - Bloc (<https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc>)
  - Flutter-Stylizer (<https://marketplace.visualstudio.com/items?itemName=gmlewis-vscode.flutter-stylizer>)
  - Bracket Pair Colorizer 2 (<https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2>)
  - Error Lens (<https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens>)

---

## Installation

- Install (<https://flutter.dev/docs/get-started/install>).

to verify proper installation

```sh
flutter doctor -v
```

- add `dotenv` (filename: dotenv) file in the root of the project with:

```sh
ENDPOINT='https://graphql-pokemon2.vercel.app'
ENVIRONMENT='dev/prod/qa'
```

- create a firebase project. info here:
<https://firebase.flutter.dev/docs/overview>

- add `GoogleService-Info.plist` in `/ios/Runner/`:
- add `google-services.json` in `/android/app/`:

---

## Architecture

<https://pub.dev/packages/flutter_bloc>

<https://bloclibrary.dev/#/architecture>

## Test

```sh
brew install lcov
```

```sh
flutter test
```

- coverage

```sh
flutter test --coverage
flutter test --coverage && lcov --remove coverage/lcov.info 'lib/*/*.freezed.dart' 'lib/*/*.g.dart' 'lib/*/*.part.dart' 'lib/core/gen/*.dart' -o coverage/lcov.info && genhtml coverage/lcov.info --output=coverage && open coverage/index.html
```

- golden

```sh
flutter test --update-goldens
```

---

## Translations

Update transaltions:

```sh
make localisation
```

## Usefull commands

```sh
# Code generator "build_runner"
flutter pub run build_runner build

# Code generator "build_runner" with confict remove
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Notifications

Local and push notification are handled by **Awesome_notification**
<https://pub.dev/packages/awesome_notifications>

To send a notification using FCM services, you need to send a POST to:

```sh
https://fcm.googleapis.com/fcm/send
```

To avoid misbehavior on Android and IOS you should send an empty **notification** field and use only **data** field for your data.

Here's an example of a POST request **body**:

```javascript
{
    "to" : "[YOUR APP FCM TOKEN]",
    "mutable_content" : true,
    "content_available": true,
    "priority": "high",
    "data" : {
        "id": 100,
        "channelKey": "basic_channel",
        "title": "Basic message",
        "body": "This is the body of a basic FCM message"
    }
}
```

Inside **headers** define:

```javascript
Content-type: application/json
Authorization: key=[server_key]
```

---
