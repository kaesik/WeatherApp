import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city/city_bloc.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/screens/new_city.dart';
import 'package:weather_app/widgets/city_card.dart';

class CitiesDrawer extends StatelessWidget {
  const CitiesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 64),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is CityUpdated && state.cities.isNotEmpty) {
                final cities = state.cities;
                return ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return CityCard(city: city);
                  },
                );
              } else {
                return const Center(
                  child: Text('No cities added'),
                );
              }
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push<City>(
                MaterialPageRoute(
                  builder: (context) => const NewCityScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add, size: 32),
          ),
        ],
      ),
    );
  }
}
