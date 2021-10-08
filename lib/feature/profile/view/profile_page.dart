import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/app_loading.dart';
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_content.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_error.dart';

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
              error: (state) => const ProfileError(),
            );
          },
        ),
      ),
    );
  }
}
