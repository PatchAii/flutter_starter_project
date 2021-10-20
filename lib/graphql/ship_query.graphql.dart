// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ship_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetShips$Query$Ship extends JsonSerializable with EquatableMixin {
  GetShips$Query$Ship();

  factory GetShips$Query$Ship.fromJson(Map<String, dynamic> json) =>
      _$GetShips$Query$ShipFromJson(json);

  String? image;

  String? id;

  String? name;

  @override
  List<Object?> get props => [image, id, name];
  @override
  Map<String, dynamic> toJson() => _$GetShips$Query$ShipToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetShips$Query extends JsonSerializable with EquatableMixin {
  GetShips$Query();

  factory GetShips$Query.fromJson(Map<String, dynamic> json) =>
      _$GetShips$QueryFromJson(json);

  List<GetShips$Query$Ship?>? ships;

  @override
  List<Object?> get props => [ships];
  @override
  Map<String, dynamic> toJson() => _$GetShips$QueryToJson(this);
}

final GET_SHIPS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'get_ships'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'ships'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'limit'),
                  value: IntValueNode(value: '10'))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetShipsQuery extends GraphQLQuery<GetShips$Query, JsonSerializable> {
  GetShipsQuery();

  @override
  final DocumentNode document = GET_SHIPS_QUERY_DOCUMENT;

  @override
  final String operationName = 'get_ships';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetShips$Query parse(Map<String, dynamic> json) =>
      GetShips$Query.fromJson(json);
}
