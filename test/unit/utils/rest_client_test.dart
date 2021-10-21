import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('Rest Client', () {
    setUpAll(() {
      registerFallbackValue(Uri());

      dotenv.testLoad(
        fileInput: '''
          ENDPOINT='https://www.google.com/'
        ''',
      );
    });

    test('GET', () async {
      final restClient = _getRestClient(MockHttpClient());
      when(() => restClient.httpClient.get(
            captureAny(),
            headers: captureAny(named: 'headers'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await restClient.get(
        api: 'api',
      );
      expect(r.statusCode, 200);
    });

    test('POST', () async {
      final restClient = _getRestClient(MockHttpClient());
      when(() => restClient.httpClient.post(
            captureAny(),
            headers: captureAny(named: 'headers'),
            body: captureAny(named: 'body'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await restClient.post(
        api: 'api',
        body: {},
      );
      expect(r.statusCode, 200);
    });

    test('PUT', () async {
      final restClient = _getRestClient(MockHttpClient());
      when(() => restClient.httpClient.put(
            captureAny(),
            headers: captureAny(named: 'headers'),
            body: captureAny(named: 'body'),
          )).thenAnswer(
        (_) => Future.value(http.Response('', 200)),
      );
      final r = await restClient.put(
        api: 'api',
        body: {},
      );
      expect(r.statusCode, 200);
    });
  });
}

RestClient _getRestClient(MockHttpClient httpClient) =>
    RestClient(httpClient: httpClient);
