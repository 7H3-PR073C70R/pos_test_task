# PROJECT

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

---

## Framework: Flutter

### Features:

**Multi-flavor support**: development, staging, production
**Platform compatibility**: Android & iOS
**Clean Architecture structure**

## Getting Started 🚀

### Project Setup
 Create an .env file in the root directory for each environment by referring to the provided example [here](env.example). Ensure that you generate the necessary environment variables as specified in the example to enable the usage of all available configurations as listed below.
 
 - .env.development
 - .env.production
 - .env.staging

### ENV Files Creation, Dependency Installation and Code Generation

Run the following command to create env files, install dependencies and generate codes

```sh
 make init
```

---

### Alternatively

### Create Env Files
```sh
touch .env.development .env.production .env.staging
```

### Install dependencies
```sh
flutter pub get
```

### Code Generation 
```sh
dart run build_runner build --delete-conflicting-outputs
```
---

### Run the app
 The application consists of 3 different variations, and you can utilize the subsequent commands to execute each distinct variation.

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*project works on iOS and Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Feature Folder Structure
```
│
├── feature
|     ├── data
│     │     ├── data source
│     │     ├── model
│     │     └── repository(implementation)
│     ├── domain     
│     │     ├── entities
│     │     ├── repository(abstract)
│     │     └── use cases
│     └── presentation
│     │     ├── bloc/cubit
│     │     ├── pages
│     │     └── widgets
│     │        
```



[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
