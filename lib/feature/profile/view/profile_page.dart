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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileData(user: user),
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
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/posts?userId=1');
            },
            child: const Text('/posts/userId:1'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/posts?userId=2');
            },
            child: const Text('/posts/userId:2'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push(
                  '/notification?title=Kimi&subtitle=Raikkonen&description=AlfaRomeo Raicing ORLEN');
            },
            child: const Text('/notification'),
          ),
          ElevatedButton(
            onPressed: () {
              RouteApp.routemaster.push('/bottom');
            },
            child: const Text('/bottom'),
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

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Id: ${user.id}'),
                Text('Name: ${user.name}'),
                Text('Username: ${user.username}'),
                Text('Email: ${user.email}'),
                Text('Phone: ${user.phone}'),
                Text('Website: ${user.website}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
