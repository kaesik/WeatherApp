import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

class AdditionalCard extends StatelessWidget {
  IconData icon;
  String title;
  String weatherState;
  String sign;
  AdditionalCard({
    super.key,
    required this.icon,
    required this.title,
    required this.weatherState,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.44,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 32),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text(title),
                      Text('$weatherState $sign'),
                    ],
                  ),
                ],
              ),
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
