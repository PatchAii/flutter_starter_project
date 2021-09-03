import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart';
import 'package:flutter_starter_project/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.repo,
  }) : super(const ProfileState.loading());

  final ProfileRepo repo;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<ProfileState> _fetch(_Fetch event) async* {
    try {
      yield const ProfileState.loading();
      final user = await repo.fetchUser();
      yield ProfileState.loaded(user: user);
    } catch (e) {
      yield const ProfileState.error();
    }
  }
}
