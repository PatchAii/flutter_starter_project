import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/ships/repo/ships_repo.dart';
import 'package:flutter_starter_project/graphql/ship_query.graphql.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ships_event.dart';
part 'ships_state.dart';
part 'ships_bloc.freezed.dart';

@injectable
class ShipsBloc extends Bloc<ShipsEvent, ShipsState> {
  ShipsBloc({
    required this.repo,
  }) : super(const ShipsState.loading()) {
    on<ShipsEvent>((event, emit) async {
      await event.map(
        fetch: (event) => _fetch(event, emit),
      );
    });
  }

  final ShipsRepo repo;

  Future _fetch(_Fetch event, Emitter<ShipsState> emit) async {
    try {
      emit(const ShipsState.loading());
      final ships = await repo.getShips();
      emit(ShipsState.loaded(
        ships: ships,
      ));
    } catch (e) {
      SnackBarController.showSnackbar(
        'Snackbar from getShips',
      );
      emit(const ShipsState.error());
    }
  }
}
