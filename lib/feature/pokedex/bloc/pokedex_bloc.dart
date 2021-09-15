import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pokedex_bloc.freezed.dart';
part 'pokedex_event.dart';
part 'pokedex_state.dart';

@injectable
class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc({
    required this.repo,
  }) : super(const PokedexState.loading());

  final PokedexRepo repo;

  @override
  Stream<PokedexState> mapEventToState(
    PokedexEvent event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<PokedexState> _fetch(_Fetch event) async* {
    try {
      yield const PokedexState.loading();
      final pokedex = await repo.getPokedex();
      yield PokedexState.loaded(
        pokedex: pokedex,
      );
    } catch (e) {
      SnackBarController.showSnackbar(
        'SnackBar from getPokedex',
      );
      yield const PokedexState.error();
    }
  }
}
