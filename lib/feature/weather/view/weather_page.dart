import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherBloc>()
        ..add(
          const WeatherEvent.fetch(),
        ),
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.map(
              loading: (state) => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (state) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.city,
                          ),
                          Text(
                            state.weathers.first.weatherStateName,
                          ),
                          Text(
                            'maxTemp ${state.weathers.first.maxTemp}',
                          ),
                          Text(
                            'theTemp ${state.weathers.first.theTemp}',
                          ),
                          Text(
                            'mnumemp ${state.weathers.first.mnumemp}',
                          ),
                          Text(
                            'airPressure ${state.weathers.first.airPressure}',
                          ),
                          Text(
                            'windSpeed ${state.weathers.first.windSpeed}',
                          ),
                          Text(
                            'windDirectionCompass ${state.weathers.first.windDirectionCompass}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.wb_sunny_rounded),
                              title: Text(
                                state.weathers[index].weatherStateName,
                              ),
                              subtitle: Text(
                                DateFormat('yyyy-MM-dd').format(
                                    state.weathers[index].applicableDate),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: state.weathers.length,
                    ),
                  )
                ],
              ),
              error: (state) => Center(
                child: Text(
                  LocaleKeys.error.tr(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
