import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/widgets/additional_card.dart';

class AdditionalTile extends StatelessWidget {
  const AdditionalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalCard(
                      icon: Icons.thermostat_outlined,
                      title: 'Temperature',
                      weatherState: state.weather.temperature!.celsius!
                          .round()
                          .toString(),
                      sign: '°',
                    ),
                    AdditionalCard(
                      icon: Icons.water,
                      title: 'Humidity',
                      weatherState: state.weather.humidity.toString(),
                      sign: '%',
                    ),
                  ],
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
