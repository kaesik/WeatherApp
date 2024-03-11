import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city/city_cubit.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/screens/new_city.dart';
import 'package:weather_app/widgets/city_card.dart';

class CitiesDrawer extends StatelessWidget {
  const CitiesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 64),
          BlocBuilder<CityCubit, CityState>(
            builder: (context, state) {
              if (state is CityLoadSuccess) {
                final cities = state.cities;

                if (cities.isNotEmpty) {
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
              } else {
                return const Center(
                  child: Text('City cubit not initialized'),
                );
              }
            },
          ),
          // Add padding between the city list and the add button
          const SizedBox(height: 16),
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
