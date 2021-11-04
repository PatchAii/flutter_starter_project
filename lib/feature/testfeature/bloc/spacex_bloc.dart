import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/testfeature/models/launch.dart';
import 'package:flutter_starter_project/feature/testfeature/repo/spacex_repo.dart';
import 'package:flutter_starter_project/utils/alert/snackbar_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'spacex_event.dart';
part 'spacex_state.dart';
part 'spacex_bloc.freezed.dart';

@injectable
class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  SpacexBloc({required this.spaceXRepo}) : super(const _NoLaunches()) {
    on<SpacexEvent>((event, emit)async {
      await event.map(search: (event)=>_search(event,emit));
      
    });
  }
  final SpaceXRepo spaceXRepo;

  Future _search(_Search event, Emitter<SpacexState> emit,)async{
    try {
      emit(const SpacexState.loading());
      final launches = await spaceXRepo.getLaunches(event.name);
      emit( SpacexState.loaded(
        launches:launches ,
      ));
    } catch (e) {
      print(e.toString());
      SnackBarController.showSnackbar(
        'SnackBar from getLaunches',
      );
      emit(const SpacexState.error());
    }
  }
}
