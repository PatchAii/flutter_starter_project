import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart';
import 'package:flutter_starter_project/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo repo;

  ProfileBloc({
    required this.repo,
  }) : super(const ProfileState.loading()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        fetch: (event) => _fetch(event, emit),
      );
    });
  }

  Future _fetch(_Fetch event, Emitter<ProfileState> emit) async {
    try {
      emit(const ProfileState.loading());
      final user = await repo.fetchUser();
      emit(
        ProfileState.loaded(user: user),
      );
    } catch (e) {
      emit(const ProfileState.error());
    }
  }
}
