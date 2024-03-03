import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city/city_bloc.dart';
import 'package:weather_app/bloc/theme/theme_bloc.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (contextTheme) => ThemeBloc()),
        BlocProvider(create: (contextCity) => CityBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (contextTheme, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
