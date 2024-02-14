import 'package:flutter/material.dart';

class CitiesDrawer extends StatelessWidget {
  const CitiesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('City 1'),
          ),
          ListTile(
            title: Text('City 2'),
          ),
          ListTile(
            title: Text('City 3'),
          ),
        ],
      ),
    );
  }
}
