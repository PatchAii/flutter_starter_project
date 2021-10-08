import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart';
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockProfileRepo extends Mock implements ProfileRepo {}

void main() {
  late MockProfileRepo repo;
  group('ProfileBloc', () {
    setUp(() {
      repo = MockProfileRepo();
    });

    blocTest<ProfileBloc, ProfileState>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits ProfileState.loaded when ProfileEvent.fetch is added',
      setUp: () {
        when(() => repo.fetchUser()).thenAnswer(
          (_) => Future.value(User.fromJson(fixture('user.json'))),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const ProfileEvent.fetch()),
      expect: () => [
        const ProfileState.loading(),
        ProfileState.loaded(
          user: User.fromJson(
            fixture(
              'user.json',
            ),
          ),
        ),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits ProfileState.error when ProfileEvent.fetch is added with error',
      setUp: () {
        when(() => repo.fetchUser()).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const ProfileEvent.fetch()),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.error(),
      ],
    );
  });
}

ProfileBloc _getBloc(MockProfileRepo repo) {
  return ProfileBloc(repo: repo);
}
