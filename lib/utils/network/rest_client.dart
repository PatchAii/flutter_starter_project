import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RestClient {
  RestClient({
    required this.httpClient,
  });
  final Client httpClient;

  Future<http.Response> get({
    required String api,
    String? endpoint,
  }) async {
    final e = endpoint ?? dotenv.env['ENDPOINT'];

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient.get(
      Uri.parse('$e$api'),
      headers: headers,
    );
  }

  Future<http.Response> post({
    required String api,
    Map<String, dynamic>? body,
    String? endpoint,
  }) async {
    final e = endpoint ?? dotenv.env['ENDPOINT'];

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient.post(
      Uri.parse('$e$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> put({
    required String api,
    required Map<String, dynamic>? body,
    String? endpoint,
  }) async {
    final e = endpoint ?? dotenv.env['ENDPOINT'];

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient.put(
      Uri.parse('$e$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }
}
