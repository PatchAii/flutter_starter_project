import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('Rest Client', () {
    setUpAll(() {
      registerFallbackValue(Uri());

      RestClient.httpClient = MockHttpClient();

      dotenv.testLoad(
        fileInput: '''
          ENDPOINT='https://www.google.com/'
        ''',
      );
    });

    test('GET', () async {
      when(() => RestClient.httpClient!.get(
            captureAny(),
            headers: captureAny(named: 'headers'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await RestClient.get(
        api: 'api',
      );
      expect(r.statusCode, 200);
    });

    test('POST', () async {
      when(() => RestClient.httpClient!.post(
            captureAny(),
            headers: captureAny(named: 'headers'),
            body: captureAny(named: 'body'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await RestClient.post(
        api: 'api',
        body: {},
      );
      expect(r.statusCode, 200);
    });

    test('PUT', () async {
      when(() => RestClient.httpClient!.put(
            captureAny(),
            headers: captureAny(named: 'headers'),
            body: captureAny(named: 'body'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await RestClient.put(
        api: 'api',
        body: {},
      );
      expect(r.statusCode, 200);
    });
  });
}
