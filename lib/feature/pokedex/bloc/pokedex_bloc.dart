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
  final PokedexRepo repo;

  PokedexBloc({
    required this.repo,
  }) : super(const PokedexState.loading()) {
    on<PokedexEvent>((event, emit) async {
      await event.map(
        fetch: (event) => _fetch(event, emit),
      );
    });
  }

  Future _fetch(_Fetch event, Emitter<PokedexState> emit) async {
    try {
      emit(const PokedexState.loading());
      final pokedex = await repo.getPokedex();
      emit(PokedexState.loaded(
        pokedex: pokedex,
      ));
    } catch (e) {
      SnackBarController.showSnackbar(
        'SnackBar from getPokedex',
      );
      emit(const PokedexState.error());
    }
  }
}
