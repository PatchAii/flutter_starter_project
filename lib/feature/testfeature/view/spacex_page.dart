import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/app_loading.dart';
import 'package:flutter_starter_project/feature/testfeature/bloc/spacex_bloc.dart';
import 'package:flutter_starter_project/feature/testfeature/models/launch.dart';
import 'package:layout/layout.dart';

class SpacexPage extends StatelessWidget {
  const SpacexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpacexBloc>()..add(const SpacexEvent.search('s')),
      child: Scaffold(
        body: BlocBuilder<SpacexBloc, SpacexState>(
          builder: (context, state) {
            return state.map(
              loading:(state) => const AppLoading(),
              noLaunches: (state) => const AppLoading(),
              loaded: (state) => LaunchesList(
                launches: state.launches,
              ),
              error: (state) => const LaunchesError(),
            );
          },
        ),
      ),
    );
  }
}

class LaunchesList extends StatelessWidget {
  const LaunchesList({
    required this.launches,
    Key? key,
  }) : super(key: key);

  final List<Launch?>? launches;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (context.layout.breakpoint > LayoutBreakpoint.sm)
          SliverGrid.count(
            crossAxisCount: 4,
            children: [
              for (final launch in launches!)
                LaunchCardGrid(
                  launch: launch!,
                ),
            ],
          ),
        if (context.layout.breakpoint <= LayoutBreakpoint.sm)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return LaunchCardList(
                  launch: launches![index]!,
                );
              },
              childCount: launches!.length,
            ),
          ),
      ],
    );
  }
}



class LaunchesError extends StatelessWidget {
  const LaunchesError({
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
              context.read<SpacexBloc>().add(
                    const SpacexEvent.search('sp'),
                  );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class LaunchCardGrid extends StatelessWidget {
  const LaunchCardGrid({
    required this.launch,
    Key? key,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              launch.name!,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child:launch.imageLink!=null?  Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(launch.imageLink!),
                  fit: BoxFit.contain,
                ),
              ),
            ) : const SizedBox(),
            ),
            const SizedBox(
              height: 16,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                launch.details!=null? SizedBox(
                        width: 300,
                        child: Text(
                          launch.details!,
                          
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ) : const SizedBox(),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LaunchCardList extends StatelessWidget {
  const LaunchCardList({
    required this.launch,
    Key? key,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: launch.imageLink!=null?  Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(launch.imageLink!),
                  fit: BoxFit.contain,
                ),
              ),
            ) : const SizedBox(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                launch.name!,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                      launch.details!=null? SizedBox(
                        width: 300,
                        child: Text(
                          launch.details!,
                          
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ) : const SizedBox(),
                      const SizedBox(
                        width: 16,
                      ),
                      
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
