import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/user_weather.dart';

class MainTile extends StatefulWidget {
  const MainTile({super.key});

  @override
  State<MainTile> createState() {
    return _MainTileState();
  }
}

class _MainTileState extends State<MainTile> {
  final _weatherData = UserWeather(apiKey);
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherData.getCurrentCity();

    try {
      final weather = await _weatherData.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_weather?.cityName ?? 'Loading...'),
        const Image(
            image: AssetImage('assets/images/l-clear-d.png'),
            width: 256,
            height: 256),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_drop_up, size: 32, color: Colors.red),
                Text('25°C', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.arrow_drop_down, size: 32, color: Colors.blue),
                Text('5°C', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Text('${_weather?.temperature.round()}°C',
            style: TextStyle(fontSize: 32)),
        Text(
          _weather?.description ?? 'Loading...',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
