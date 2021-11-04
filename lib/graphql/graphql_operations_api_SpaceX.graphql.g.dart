// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_operations_api_SpaceX.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLaunches$Query$Launch$LaunchLinks
    _$GetLaunches$Query$Launch$LaunchLinksFromJson(Map<String, dynamic> json) {
  return GetLaunches$Query$Launch$LaunchLinks()
    ..flickrImages = (json['flickr_images'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList();
}

Map<String, dynamic> _$GetLaunches$Query$Launch$LaunchLinksToJson(
        GetLaunches$Query$Launch$LaunchLinks instance) =>
    <String, dynamic>{
      'flickr_images': instance.flickrImages,
    };

GetLaunches$Query$Launch _$GetLaunches$Query$LaunchFromJson(
    Map<String, dynamic> json) {
  return GetLaunches$Query$Launch()
    ..missionName = json['mission_name'] as String?
    ..details = json['details'] as String?
    ..links = json['links'] == null
        ? null
        : GetLaunches$Query$Launch$LaunchLinks.fromJson(
            json['links'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetLaunches$Query$LaunchToJson(
        GetLaunches$Query$Launch instance) =>
    <String, dynamic>{
      'mission_name': instance.missionName,
      'details': instance.details,
      'links': instance.links?.toJson(),
    };

GetLaunches$Query _$GetLaunches$QueryFromJson(Map<String, dynamic> json) {
  return GetLaunches$Query()
    ..launches = (json['launches'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetLaunches$Query$Launch.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetLaunches$QueryToJson(GetLaunches$Query instance) =>
    <String, dynamic>{
      'launches': instance.launches?.map((e) => e?.toJson()).toList(),
    };

GetLaunchesArguments _$GetLaunchesArgumentsFromJson(Map<String, dynamic> json) {
  return GetLaunchesArguments(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GetLaunchesArgumentsToJson(
        GetLaunchesArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
