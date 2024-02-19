import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class AdditionalTile extends StatefulWidget {
  const AdditionalTile({super.key});

  @override
  State<AdditionalTile> createState() {
    return _AdditionalTileState();
  }
}

class _AdditionalTileState extends State<AdditionalTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.weather.areaName}, ${state.weather.country}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.weather.temperature!.celsius!.round()}°',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.arrow_drop_up,
                                size: 24, color: Colors.red),
                            Text('${state.weather.tempMax!.celsius!.round()}°',
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.arrow_drop_down,
                                size: 24, color: Colors.blue),
                            Text('${state.weather.tempMin!.celsius!.round()}°',
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  state.weather.weatherDescription.toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text(
              'Error fetching weather',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
