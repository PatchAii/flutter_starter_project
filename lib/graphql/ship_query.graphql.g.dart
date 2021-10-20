// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ship_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetShips$Query$Ship _$GetShips$Query$ShipFromJson(Map<String, dynamic> json) {
  return GetShips$Query$Ship()
    ..image = json['image'] as String?
    ..id = json['id'] as String?
    ..name = json['name'] as String?;
}

Map<String, dynamic> _$GetShips$Query$ShipToJson(
        GetShips$Query$Ship instance) =>
    <String, dynamic>{
      'image': instance.image,
      'id': instance.id,
      'name': instance.name,
    };

GetShips$Query _$GetShips$QueryFromJson(Map<String, dynamic> json) {
  return GetShips$Query()
    ..ships = (json['ships'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetShips$Query$Ship.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetShips$QueryToJson(GetShips$Query instance) =>
    <String, dynamic>{
      'ships': instance.ships?.map((e) => e?.toJson()).toList(),
    };
