import 'package:flutter/material.dart';

class NewCityScreen extends StatefulWidget {
  const NewCityScreen({super.key});

  @override
  State<NewCityScreen> createState() => _NewCityScreenState();
}

class _NewCityScreenState extends State<NewCityScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
// PlaceLocation? _selectedLocation;

  // void _savePlace() {
  //   if (_formKey.currentState!.validate() &&
  //       _selectedImage != null &&
  //       _selectedLocation != null) {
  //     _formKey.currentState!.save();
  //
  //     ref
  //         .read(
  //           userPlacesProvider.notifier,
  //         )
  //         .addPlace(
  //           _enteredName,
  //           _selectedImage!,
  //           _selectedLocation!,
  //         );
  //
  //     Navigator.of(context).pop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New City'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Name'),
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
              const SizedBox(height: 16),
              // LocationInput(
              //   onSelectLocation: (location) {
              //     _selectedLocation = location;
              //   },
              // ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                // onPressed: _savePlace,
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add City',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
