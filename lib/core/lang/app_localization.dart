// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "pokedex": "Pokedex",
  "profile": "Profile",
  "login": "Login",
  "error": "Error",
  "posts": "Posts",
  "ships": "Ships"
};
static const Map<String,dynamic> it = {
  "pokedex": "Pokedex",
  "profile": "Profilo",
  "login": "Login",
  "error": "Errore",
  "posts": "Posts",
  "ships": "Navi"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "it": it};
}
