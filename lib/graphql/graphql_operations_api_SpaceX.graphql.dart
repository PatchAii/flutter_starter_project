// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_operations_api_SpaceX.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLaunches$Query$Launch$LaunchLinks extends JsonSerializable
    with EquatableMixin {
  GetLaunches$Query$Launch$LaunchLinks();

  factory GetLaunches$Query$Launch$LaunchLinks.fromJson(
          Map<String, dynamic> json) =>
      _$GetLaunches$Query$Launch$LaunchLinksFromJson(json);

  @JsonKey(name: 'flickr_images')
  List<String?>? flickrImages;

  @override
  List<Object?> get props => [flickrImages];
  @override
  Map<String, dynamic> toJson() =>
      _$GetLaunches$Query$Launch$LaunchLinksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLaunches$Query$Launch extends JsonSerializable with EquatableMixin {
  GetLaunches$Query$Launch();

  factory GetLaunches$Query$Launch.fromJson(Map<String, dynamic> json) =>
      _$GetLaunches$Query$LaunchFromJson(json);

  @JsonKey(name: 'mission_name')
  String? missionName;

  String? details;

  GetLaunches$Query$Launch$LaunchLinks? links;

  @override
  List<Object?> get props => [missionName, details, links];
  @override
  Map<String, dynamic> toJson() => _$GetLaunches$Query$LaunchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLaunches$Query extends JsonSerializable with EquatableMixin {
  GetLaunches$Query();

  factory GetLaunches$Query.fromJson(Map<String, dynamic> json) =>
      _$GetLaunches$QueryFromJson(json);

  List<GetLaunches$Query$Launch?>? launches;

  @override
  List<Object?> get props => [launches];
  @override
  Map<String, dynamic> toJson() => _$GetLaunches$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLaunchesArguments extends JsonSerializable with EquatableMixin {
  GetLaunchesArguments({required this.name});

  @override
  factory GetLaunchesArguments.fromJson(Map<String, dynamic> json) =>
      _$GetLaunchesArgumentsFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$GetLaunchesArgumentsToJson(this);
}

final GET_LAUNCHES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'get_launches'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'launches'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'find'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'mission_name'),
                        value: VariableNode(name: NameNode(value: 'name')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'mission_name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'details'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'links'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'flickr_images'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class GetLaunchesQuery
    extends GraphQLQuery<GetLaunches$Query, GetLaunchesArguments> {
  GetLaunchesQuery({required this.variables});

  @override
  final DocumentNode document = GET_LAUNCHES_QUERY_DOCUMENT;

  @override
  final String operationName = 'get_launches';

  @override
  final GetLaunchesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetLaunches$Query parse(Map<String, dynamic> json) =>
      GetLaunches$Query.fromJson(json);
}
