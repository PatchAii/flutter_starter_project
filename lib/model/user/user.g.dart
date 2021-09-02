// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as int,
    name: json['name'] as String?,
    username: json['username'] as String?,
    email: json['email'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String?,
    website: json['website'] as String?,
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    street: json['street'] as String?,
    suite: json['suite'] as String?,
    city: json['city'] as String?,
    zipcode: json['zipcode'] as String?,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

_$_Geo _$_$_GeoFromJson(Map<String, dynamic> json) {
  return _$_Geo(
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
  );
}

Map<String, dynamic> _$_$_GeoToJson(_$_Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Company _$_$_CompanyFromJson(Map<String, dynamic> json) {
  return _$_Company(
    name: json['name'] as String?,
    catchPhrase: json['catchPhrase'] as String?,
    bs: json['bs'] as String?,
  );
}

Map<String, dynamic> _$_$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
