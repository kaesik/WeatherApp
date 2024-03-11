import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/city/city_cubit.dart';
import 'package:weather_app/bloc/database/database_cubit.dart';
import 'package:weather_app/models/city.dart';

class NewCityScreen extends StatefulWidget {
  const NewCityScreen({super.key});

  @override
  State<NewCityScreen> createState() => _NewCityScreenState();
}

class _NewCityScreenState extends State<NewCityScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  CityCubit? _cityCubit;
  CityLocation? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _cityCubit = context.read<CityCubit>();
  }

  void _savePlace() {
    if (_formKey.currentState!.validate() && _selectedLocation != null) {
      _formKey.currentState!.save();

      if (_cityCubit != null) {
        _cityCubit!.addCity(
          // Change from addCities to addCity
          _enteredName,
          'Country', // Replace 'Country' with the actual country data
          _selectedLocation?.latitude ?? 0.0,
          _selectedLocation?.longitude ?? 0.0,
        );
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New City'),
      ),
      body: BlocBuilder<DatabaseCubit, DatabaseState>(
        builder: (context, state) {
          if (state is LoadDatabaseState) {
            return BlocConsumer<CityCubit, CityState>(
              listener: (context, state) {
                // Handle CityUpdated or CityLoadFailure events if needed
              },
              builder: (context, state) {
                if (state is CityLoadSuccess) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                            maxLength: 50,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                            initialValue: _enteredName,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length <= 1 ||
                                  value.trim().length > 50) {
                                return 'Please enter a name. (1-50 characters)';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredName = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _savePlace,
                            icon: const Icon(Icons.add),
                            label: const Text(
                              'Add City',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is CityLoadFailure) {
                  return const Center(
                    child: Text('Failed to load cities'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Text('Database not loaded'),
            );
          }
        },
      ),
    );
  }
}
