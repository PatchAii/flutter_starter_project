// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_operations_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokedex$Query$Pokemon$PokemonDimension
    _$GetPokedex$Query$Pokemon$PokemonDimensionFromJson(
        Map<String, dynamic> json) {
  return GetPokedex$Query$Pokemon$PokemonDimension()
    ..minimum = json['minimum'] as String?
    ..maximum = json['maximum'] as String?;
}

Map<String, dynamic> _$GetPokedex$Query$Pokemon$PokemonDimensionToJson(
        GetPokedex$Query$Pokemon$PokemonDimension instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GetPokedex$Query$Pokemon _$GetPokedex$Query$PokemonFromJson(
    Map<String, dynamic> json) {
  return GetPokedex$Query$Pokemon()
    ..name = json['name'] as String?
    ..image = json['image'] as String?
    ..maxHP = json['maxHP'] as int?
    ..maxCP = json['maxCP'] as int?
    ..weight = json['weight'] == null
        ? null
        : GetPokedex$Query$Pokemon$PokemonDimension.fromJson(
            json['weight'] as Map<String, dynamic>)
    ..height = json['height'] == null
        ? null
        : GetPokedex$Query$Pokemon$PokemonDimension.fromJson(
            json['height'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPokedex$Query$PokemonToJson(
        GetPokedex$Query$Pokemon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'maxHP': instance.maxHP,
      'maxCP': instance.maxCP,
      'weight': instance.weight?.toJson(),
      'height': instance.height?.toJson(),
    };

GetPokedex$Query _$GetPokedex$QueryFromJson(Map<String, dynamic> json) {
  return GetPokedex$Query()
    ..pokemons = (json['pokemons'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetPokedex$Query$Pokemon.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetPokedex$QueryToJson(GetPokedex$Query instance) =>
    <String, dynamic>{
      'pokemons': instance.pokemons?.map((e) => e?.toJson()).toList(),
    };
