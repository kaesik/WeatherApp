import 'package:flutter/material.dart';

class CityCard extends StatefulWidget {
  const CityCard({super.key});

  @override
  State<CityCard> createState() {
    return _CityCardState();
  }
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
        child: ListTile(
      title: Text('City Name'),
      subtitle: Text('Country Name'),
      trailing: Icon(Icons.more_vert),
    ));
  }
}
