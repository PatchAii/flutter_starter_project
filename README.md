# Flutter starter project 🚦 📱 💻 🖥️

[![style: ficcanaso](https://img.shields.io/badge/style-ficcanaso-yellow)](https://github.com/dbbd59/ficcanaso)

## Introduction

> a template with best practices for starting a new app or familiarizing yourself with our projects architecture

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

---

## Architecture

<https://pub.dev/packages/flutter_bloc>

<https://bloclibrary.dev/#/architecture>

## Test

```sh
flutter test
```

- coverage

```sh
flutter test --coverage
flutter test --coverage && lcov --remove coverage/lcov.info 'lib/*/*.freezed.dart' 'lib/*/*.g.dart' 'lib/*/*.part.dart' 'lib/generated/*.dart' -o coverage/lcov.info && genhtml coverage/lcov.info --output=coverage && open coverage/index.html
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
