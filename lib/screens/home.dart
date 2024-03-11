import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/widgets/additional_tile.dart';
import 'package:weather_app/widgets/cities_drawer.dart';
import 'package:weather_app/widgets/main_tile.dart';
import 'package:weather_app/widgets/settings_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to determine the current device location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // Handle permanently denied location permissions
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current device position
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _determinePosition(),
      builder: (context, snap) {
        if (snap.hasData) {
          return BlocProvider<WeatherBloc>(
            // Create a WeatherBloc and fetch weather based on the device location
            create: (context) {
              return WeatherBloc()..add(FetchWeather(snap.data as Position));
            },
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.location_on),
                    );
                  },
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(Icons.settings),
                    );
                  }),
                ],
              ),
              drawer: const CitiesDrawer(),
              endDrawer: const SettingsDrawer(),
              drawerEdgeDragWidth: 100,
              body: const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 128),
                    MainTile(),
                    SizedBox(height: 128 * 3),
                    AdditionalTile(),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Show a loading indicator while determining the device location
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
