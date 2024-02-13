import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.grey,
          background: Color(0xFFF0F0F0),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
