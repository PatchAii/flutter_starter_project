import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:flutter_starter_project/model/model.dart';
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
              loading: (state) => const WeatherLoading(),
              loaded: (state) => WeatherList(
                city: state.city,
                weathers: state.weathers,
              ),
              error: (state) => const WeatherError(),
            );
          },
        ),
      ),
    );
  }
}

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
    required this.weathers,
    required this.city,
  }) : super(key: key);

  final List<Weather> weathers;
  final String city;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              city,
            ),
          ),
        ),
        if (weathers.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weathers.first.weatherStateName,
                  ),
                  Text(
                    'maxTemp ${weathers.first.maxTemp}',
                  ),
                  Text(
                    'theTemp ${weathers.first.theTemp}',
                  ),
                  Text(
                    'mnumemp ${weathers.first.mnumemp}',
                  ),
                  Text(
                    'airPressure ${weathers.first.airPressure}',
                  ),
                  Text(
                    'windSpeed ${weathers.first.windSpeed}',
                  ),
                  Text(
                    'windDirectionCompass ${weathers.first.windDirectionCompass}',
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
                      weathers[index].weatherStateName,
                    ),
                    subtitle: Text(
                      DateFormat('yyyy-MM-dd')
                          .format(weathers[index].applicableDate),
                    ),
                  ),
                ),
              );
            },
            childCount: weathers.length,
          ),
        )
      ],
    );
  }
}

class WeatherError extends StatelessWidget {
  const WeatherError({
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
              context.read<WeatherBloc>().add(
                    const WeatherEvent.fetch(),
                  );
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
