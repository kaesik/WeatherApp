import 'package:flutter/material.dart';
import 'package:weather_app/widgets/city_card.dart';

class CitiesDrawer extends StatelessWidget {
  const CitiesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CityCard(),
          CityCard(),
          CityCard(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
