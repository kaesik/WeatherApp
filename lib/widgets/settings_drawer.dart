import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

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
