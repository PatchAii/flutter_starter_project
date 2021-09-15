import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/fixture_reader.dart';
import '../utils/golden_device_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('PokedexView', () {
    testGoldens('PokedexError', (tester) async {
      final builder = getDefaultBuilder(
        const PokedexError(),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'pokedex_error');
    });

    testGoldens('PokedexList', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          PokedexList(
            pokedex: [
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
              GetPokedex$Query$Pokemon.fromJson(fixture('pokemon.json')),
            ],
          ),
        );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'pokedex_list');
      });
    });

    testGoldens('PokedexList Empty', (tester) async {
      final builder = getDefaultBuilder(
        const PokedexList(
          pokedex: [],
        ),
      );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'pokedex_list_empty');
    });
  });
}
