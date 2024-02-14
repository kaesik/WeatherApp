import 'package:flutter/material.dart';

class MainTile extends StatefulWidget {
  const MainTile({super.key});

  @override
  State<MainTile> createState() {
    return _MainTileState();
  }
}

class _MainTileState extends State<MainTile> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Loading...'),
        Image(
            image: AssetImage('assets/images/l-clear-d.png'),
            width: 256,
            height: 256),
        Row(
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
        Text('°C', style: TextStyle(fontSize: 32)),
        Text(
          'Loading...',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
