import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
  });

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
      case > 800 && <= 804:
        return 'clouds';
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

  @override
  Widget build(BuildContext context) {
    var mode = getDarkLightMode();
    var weather = getWeatherIcon(800);
    var dayNight = getDayNight();
    return Image(
        image: AssetImage('assets/images/$mode-$weather-$dayNight.png'),
        width: 256,
        height: 256);
  }
}
