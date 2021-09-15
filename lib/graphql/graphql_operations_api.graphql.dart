// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_operations_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPokedex$Query$Pokemon$PokemonDimension extends JsonSerializable
    with EquatableMixin {
  GetPokedex$Query$Pokemon$PokemonDimension();

  factory GetPokedex$Query$Pokemon$PokemonDimension.fromJson(
          Map<String, dynamic> json) =>
      _$GetPokedex$Query$Pokemon$PokemonDimensionFromJson(json);

  String? minimum;

  String? maximum;

  @override
  List<Object?> get props => [minimum, maximum];
  @override
  Map<String, dynamic> toJson() =>
      _$GetPokedex$Query$Pokemon$PokemonDimensionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPokedex$Query$Pokemon extends JsonSerializable with EquatableMixin {
  GetPokedex$Query$Pokemon();

  factory GetPokedex$Query$Pokemon.fromJson(Map<String, dynamic> json) =>
      _$GetPokedex$Query$PokemonFromJson(json);

  String? name;

  String? image;

  int? maxHP;

  int? maxCP;

  GetPokedex$Query$Pokemon$PokemonDimension? weight;

  GetPokedex$Query$Pokemon$PokemonDimension? height;

  @override
  List<Object?> get props => [name, image, maxHP, maxCP, weight, height];
  @override
  Map<String, dynamic> toJson() => _$GetPokedex$Query$PokemonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPokedex$Query extends JsonSerializable with EquatableMixin {
  GetPokedex$Query();

  factory GetPokedex$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPokedex$QueryFromJson(json);

  List<GetPokedex$Query$Pokemon?>? pokemons;

  @override
  List<Object?> get props => [pokemons];
  @override
  Map<String, dynamic> toJson() => _$GetPokedex$QueryToJson(this);
}

final GET_POKEDEX_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'get_pokedex'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'pokemons'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'first'),
                  value: IntValueNode(value: '151'))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'maxHP'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'maxCP'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'weight'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'minimum'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'maximum'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'height'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'minimum'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'maximum'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetPokedexQuery extends GraphQLQuery<GetPokedex$Query, JsonSerializable> {
  GetPokedexQuery();

  @override
  final DocumentNode document = GET_POKEDEX_QUERY_DOCUMENT;

  @override
  final String operationName = 'get_pokedex';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetPokedex$Query parse(Map<String, dynamic> json) =>
      GetPokedex$Query.fromJson(json);
}
