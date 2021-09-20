import 'package:artemis/artemis.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

class GraphqlClient {
  GraphqlClient._();

  static Future<GraphQLResponse<T>> exec<T, U extends JsonSerializable>({
    required GraphQLQuery<T, U> query,
    String? endpoint,
  }) async {
    final client = await _initClient(endpoint);

    return client.execute(query);
  }

  static Future<ArtemisClient> _initClient(String? endpoint) async {
    await dotenv.load(fileName: 'dotenv');

    return ArtemisClient(
      endpoint ?? dotenv.env['ENDPOINT']!,
      httpClient: AuthenticatedClient(),
    );
  }
}

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    //Insert token here
    return _inner.send(request);
  }
}
