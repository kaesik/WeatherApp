import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/repository/city_repository.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final _cityRepo = CityRepository();
  final Database database;
  CityCubit({required this.database}) : super(const InitCityState(0));

  int _counter = 1;
  List<City> _cities = [];
  List<City> get cities => _cities;

  Future<void> getCities() async {
    try {
      _cities = await _cityRepo.getCities(database: database);
      emit(InitCityState(_counter++));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addCities(
    String name,
    String country,
    double latitude,
    double longitude,
  ) async {
    try {
      await _cityRepo.addCity(
        database: database,
        name: name,
        country: country,
        latitude: latitude,
        longitude: longitude,
      );
      emit(InitCityState(_counter++));
      getCities();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeCity(int id) async {
    try {
      await _cityRepo.removeCity(
        database: database,
        id: id,
      );
      emit(InitCityState(_counter++));
      getCities();
    } catch (e) {
      log(e.toString());
    }
  }
}
