// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ship _$ShipFromJson(Map<String, dynamic> json) {
  return _Ship.fromJson(json);
}

/// @nodoc
class _$ShipTearOff {
  const _$ShipTearOff();

  _Ship call({required String id, String? image, String? name}) {
    return _Ship(
      id: id,
      image: image,
      name: name,
    );
  }

  Ship fromJson(Map<String, Object> json) {
    return Ship.fromJson(json);
  }
}

/// @nodoc
const $Ship = _$ShipTearOff();

/// @nodoc
mixin _$Ship {
  String get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipCopyWith<Ship> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipCopyWith<$Res> {
  factory $ShipCopyWith(Ship value, $Res Function(Ship) then) =
      _$ShipCopyWithImpl<$Res>;
  $Res call({String id, String? image, String? name});
}

/// @nodoc
class _$ShipCopyWithImpl<$Res> implements $ShipCopyWith<$Res> {
  _$ShipCopyWithImpl(this._value, this._then);

  final Ship _value;
  // ignore: unused_field
  final $Res Function(Ship) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ShipCopyWith<$Res> implements $ShipCopyWith<$Res> {
  factory _$ShipCopyWith(_Ship value, $Res Function(_Ship) then) =
      __$ShipCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? image, String? name});
}

/// @nodoc
class __$ShipCopyWithImpl<$Res> extends _$ShipCopyWithImpl<$Res>
    implements _$ShipCopyWith<$Res> {
  __$ShipCopyWithImpl(_Ship _value, $Res Function(_Ship) _then)
      : super(_value, (v) => _then(v as _Ship));

  @override
  _Ship get _value => super._value as _Ship;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_Ship(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ship implements _Ship {
  const _$_Ship({required this.id, this.image, this.name});

  factory _$_Ship.fromJson(Map<String, dynamic> json) =>
      _$_$_ShipFromJson(json);

  @override
  final String id;
  @override
  final String? image;
  @override
  final String? name;

  @override
  String toString() {
    return 'Ship(id: $id, image: $image, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ship &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ShipCopyWith<_Ship> get copyWith =>
      __$ShipCopyWithImpl<_Ship>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShipToJson(this);
  }
}

abstract class _Ship implements Ship {
  const factory _Ship({required String id, String? image, String? name}) =
      _$_Ship;

  factory _Ship.fromJson(Map<String, dynamic> json) = _$_Ship.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShipCopyWith<_Ship> get copyWith => throw _privateConstructorUsedError;
}
