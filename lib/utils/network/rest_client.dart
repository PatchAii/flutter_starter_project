import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

//Middleware per le chiamate REST

class RestClient {
  RestClient._();

  static Future<http.Response> post({
    required String api,
    Map<String, dynamic>? body,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return http.post(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get({
    required String api,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return http.get(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
    );
  }

  static Future<http.Response> put({
    required String api,
    required Map<String, dynamic>? body,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    return http.put(
      Uri.parse('${dotenv.env['ENDPOINT']}$api'),
      headers: headers,
      body: jsonEncode(body),
    );
  }
}
