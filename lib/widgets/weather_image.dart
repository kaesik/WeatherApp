import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {}

        if (state is WeatherSuccess) {
          getDarkLightMode() {
            if (true) {
              return 'd';
            } else {
              return 'l';
            }
          }

          getWeatherIcon(int code) {
            switch (code) {
              case >= 200 && < 300:
                return 'tstorm';
              case >= 300 && < 400:
                return 'drizzle';
              case >= 500 && < 600:
                return 'rain';
              case >= 600 && < 700:
                return 'snow';
              case >= 700 && < 800:
                return 'fog';
              case == 800:
                return 'clear';
              case == 801:
                return 'pcloudy';
              case > 802 && <= 803:
                return 'mcloudy';
              case == 804:
                return 'cloudy';
              default:
                return 'clear';
            }
          }

          getDayNight() {
            // var hour = DateTime.now().hour;
            var hour = 19;
            if (hour >= 6 && hour < 18) {
              return 'd';
            } else {
              return 'n';
            }
          }

          var mode = getDarkLightMode();
          var weather =
              getWeatherIcon(state.weather.weatherConditionCode!.toInt());
          var dayNight = getDayNight();
          return Image(
              image: AssetImage('assets/images/$mode-$weather-$dayNight.png'),
              width: 256,
              height: 256);
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherFailure) {
          return const Image(
              image: AssetImage('assets/images/unknown.png'),
              width: 256,
              height: 256);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
