import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city/city_cubit.dart';
import 'package:weather_app/bloc/database/database_cubit.dart';
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
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => DatabaseCubit()..initDatabase()),
        BlocProvider(
          create: (context) {
            final database = context.read<DatabaseCubit>().database;

            if (database != null) {
              return CityCubit(
                database: database,
                databaseCubit: context.read<DatabaseCubit>(), // Add this line
              );
            } else {
              throw Exception('Database is not initialized');
            }
          },
        ),
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
