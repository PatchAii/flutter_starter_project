import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route.dart';
import 'package:flutter_starter_project/feature/common/widget/app_loading.dart';
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart';
import 'package:flutter_starter_project/model/user/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()
        ..add(
          const ProfileEvent.fetch(),
        ),
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.map(
                loading: (state) => const AppLoading(),
                loaded: (state) => ProfileContent(user: state.user),
                error: (state) => const ProfileError());
          },
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.name!),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/settings');
            },
            child: const Text('/settings'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/profile/sub');
            },
            child: const Text('/profile/sub'),
          ),
        ],
      ),
    );
  }
}

class ProfileError extends StatelessWidget {
  const ProfileError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.error.tr(),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProfileBloc>().add(
                    const ProfileEvent.fetch(),
                  );
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
