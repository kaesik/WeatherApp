import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/theme/theme_bloc.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Switch(
                  value: context.read<ThemeBloc>().state == ThemeMode.system
                      ? MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      : context.read<ThemeBloc>().state == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      context.read<ThemeBloc>().add(ThemeChanged(value));
                      // print('Dark Mode: $value');
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
