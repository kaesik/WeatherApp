import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  WeatherImage({
    super.key,
  });

  getDayTime() {
    var hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return 'd';
    } else {
      return 'n';
    }
  }

  getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return 'tstorm';
      case >= 300 && < 400:
        return '2';
      case >= 500 && < 600:
        return '3';
      case >= 600 && < 700:
        return '4';
      case >= 700 && < 800:
        return '5';
      case == 800:
        return '6';
      case > 800 && <= 804:
        return '7';
      default:
        return '7';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Image(
        image: AssetImage('assets/images/l-clear-d.png'),
        width: 256,
        height: 256);
  }
}
