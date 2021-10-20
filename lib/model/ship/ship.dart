import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship.freezed.dart';
part 'ship.g.dart';

@freezed
class Ship with _$Ship {
  const factory Ship({
    required String id,
    String? image,
    String? name,
  }) = _Ship;

  factory Ship.fromJson(Map<String, dynamic> json) => _$ShipFromJson(json);
}
