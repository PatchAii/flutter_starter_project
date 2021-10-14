ENV = dev

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

localisation:
	@flutter pub run easy_localization:generate -S assets/translations -O lib/core/lang -o app_localization.dart
	@flutter pub run easy_localization:generate -S assets/translations -O lib/core/lang -f keys -o locale_keys.g.dart $(c)

build_runner:
	@flutter pub run build_runner build --delete-conflicting-outputs

test-unit:
	@flutter test

test-coverage:
	@flutter test --coverage && lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart' '**/*.graphql.dart' '**/*.part.dart' '**/*.config.dart' '**/*_event.dart' '**/*_state.dart' '**/*_repo.dart' '**/core/*' '**/*_controller.dart' '**/alert/*.dart' -o coverage/lcov.info && genhtml coverage/lcov.info --output=coverage && open coverage/index.html

test-golden:
	@flutter test --update-goldens

clean:
	@rm -rf pubspec.lock
	@flutter clean

format:
	@dart format .

lint:
	@dart analyze .

icon-update:
	@flutter pub run flutter_launcher_icons:main -f icon-app-$(ENV).yaml

splash-update:
	@flutter pub run flutter_native_splash:create --path=icon-app-$(ENV).yaml

check-unused-files:
	@flutter pub run dart_code_metrics:metrics check-unused-files lib