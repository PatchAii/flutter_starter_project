import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RestClient {
  RestClient._();

  static Client? httpClient;

  static Future<http.Response> post({
    required String api,
    Map<String, dynamic>? body,
  }) async {
    _initClient();

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient!.post(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get({
    required String api,
  }) async {
    _initClient();

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient!.get(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
    );
  }

  static Future<http.Response> put({
    required String api,
    required Map<String, dynamic>? body,
  }) async {
    _initClient();

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return httpClient!.put(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static void _initClient() {
    httpClient ??= http.Client();
  }
}
