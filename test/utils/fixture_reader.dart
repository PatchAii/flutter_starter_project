import 'dart:convert';
import 'dart:io';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/json/$name').readAsStringSync());
