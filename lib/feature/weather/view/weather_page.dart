import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/widget/app_loading.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';

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
              loading: (state) => const AppLoading(),
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

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
    required this.weathers,
    required this.city,
  }) : super(key: key);

  final String city;
  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (weathers.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: WeatherHeader(weathers: weathers, city: city),
            ),
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == 0) return const SizedBox();
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset(
                          'assets/weather/${weathers[index].weatherStateAbbr.toString().split('.').last}.svg',
                        ),
                      ),
                      title: Text(
                        weathers[index].weatherStateName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat('d LLLL yyyy')
                            .format(weathers[index].applicableDate),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
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

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    Key? key,
    required this.weathers,
    required this.city,
  }) : super(key: key);

  final List<Weather> weathers;
  final String city;

  @override
  Widget build(BuildContext context) {
    if (context.layout.breakpoint > LayoutBreakpoint.xs) {
      return Row(
        children: [
          Expanded(
            child: _buildWeatherInfos(context),
          ),
          Expanded(
            child: _buildWeatherInfoSvg(),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWeatherInfos(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWeatherInfoSvg(),
            ],
          ),
        ],
      );
    }
  }

  SizedBox _buildWeatherInfoSvg() {
    return SizedBox(
      height: 200,
      width: 200,
      child: SvgPicture.asset(
        'assets/weather/${weathers.first.weatherStateAbbr.toString().split('.').last}.svg',
      ),
    );
  }

  Column _buildWeatherInfos(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('d LLLL yyyy').format(
            weathers.first.applicableDate,
          ),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          city,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          weathers.first.weatherStateName,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'maxTemp ${weathers.first.maxTemp}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'theTemp ${weathers.first.theTemp}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'mnumemp ${weathers.first.mnumemp}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'airPressure ${weathers.first.airPressure}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'windSpeed ${weathers.first.windSpeed}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          'windDirectionCompass ${weathers.first.windDirectionCompass}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
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
