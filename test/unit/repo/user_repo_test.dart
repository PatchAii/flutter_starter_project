import 'dart:convert';

import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late MockRestClient restClient;
  late ProfileRepo repo;
  group('Profile repo', () {
    setUpAll(() {
      restClient = MockRestClient();
      repo = ProfileRepo(
        restClient: restClient,
      );
    });

    test('when FetchUser, return User', () async {
      final u = fixture(
        'user.json',
      );
      when(() => restClient.get(
            api: captureAny(named: 'api'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) => Future.value(http.Response(
          json.encode(
            u,
          ),
          200,
        )),
      );
      final user = await repo.fetchUser();
      expect(
        user,
        User.fromJson(
          u,
        ),
      );
    });

    test('when FetchUser return 404, throws TypeError', () async {
      when(() => restClient.get(
            api: captureAny(named: 'api'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) => Future.value(http.Response(
          json.encode(
            fixture(
              'empty.json',
            ),
          ),
          404,
        )),
      );

      expect(
        () async => await repo.fetchUser(),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
