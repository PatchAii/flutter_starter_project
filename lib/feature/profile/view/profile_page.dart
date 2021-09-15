import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route.dart';
import 'package:flutter_starter_project/feature/common/widget/app_loading.dart';
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart';
import 'package:flutter_starter_project/model/user/user.dart';
import 'package:layout/layout.dart';

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileData(
            user: user,
          ),
          const ProfileActions(),
        ],
      ),
    );
  }
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/settings');
          },
          child: const Text('/settings'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/profile/sub');
          },
          child: const Text('/profile/sub'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/profile/bottomsheet');
          },
          child: const Text('/bottomsheet'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/posts?userId=1');
          },
          child: const Text('/posts/userId:1'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push('/posts?userId=2');
          },
          child: const Text('/posts/userId:2'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {
            RouteApp.routemaster.push(
                '/notification?title=Kimi&subtitle=Raikkonen&description=AlfaRomeo Raicing ORLEN');
          },
          child: const Text('/notification'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () async {
            await NotificationController.createBasicNotification();
          },
          child: const Text('createBasicNotification'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () async {
            await NotificationController.createBadgeNotification();
          },
          child: const Text('createBadgeNotification'),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
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
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(.7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: (context.layout.breakpoint > LayoutBreakpoint.xs)
                      ? 75.0
                      : 25.0,
                  backgroundImage:
                      Image.network('https://placekitten.com/500/500').image,
                  backgroundColor: Colors.transparent,
                ),
              ),
              if (context.layout.breakpoint > LayoutBreakpoint.xs)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${user.id}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'Name: ${user.name}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Username: ${user.username}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Phone: ${user.phone}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Website: ${user.website}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${user.id}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'Name: ${user.name}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Username: ${user.username}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Phone: ${user.phone}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Website: ${user.website}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
