import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wroclove', style: TextStyle(fontSize: 32)),
            Icon(Icons.sunny, size: 250, color: Colors.amber),
            Text('25°C', style: TextStyle(fontSize: 32)),
            Text('Sunny', style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
