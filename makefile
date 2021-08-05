help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

localisation:	## code generation for localization files and keys
	flutter pub run easy_localization:generate -S assets/translations -O lib/core/lang -o app_localization.dart
	flutter pub run easy_localization:generate -S assets/translations -O lib/core/lang -f keys -o locale_keys.g.dart $(c)