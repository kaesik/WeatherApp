import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/bloc/database/database_cubit.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/repository/city_repository.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final CityRepository _cityRepo = CityRepository();
  final Database? database;
  final DatabaseCubit databaseCubit;

  CityCubit({
    required this.database,
    required this.databaseCubit,
  }) : super(CityInitial());

  Future<void> getCities() async {
    try {
      final cities =
          await _cityRepo.getCities(database: databaseCubit.database!);
      emit(CityLoadSuccess(cities));
    } catch (e) {
      log('Error getting cities: $e');
      emit(CityLoadFailure());
    }
  }

  Future<void> addCity(
    String name,
    String country,
    double latitude,
    double longitude,
  ) async {
    try {
      final newCity = City(
        name: name,
        country: country,
        location: CityLocation(latitude: latitude, longitude: longitude),
      );

      await _cityRepo.addCity(
        database: databaseCubit.database!,
        name: newCity.name,
        country: newCity.country,
        latitude: newCity.location.latitude,
        longitude: newCity.location.longitude,
      );

      emit(CityLoadSuccess(
          await _cityRepo.getCities(database: databaseCubit.database!)));
    } catch (e) {
      log(e.toString());
      emit(CityLoadFailure());
    }
  }

  Future<void> removeCity(int id) async {
    try {
      await _cityRepo.removeCity(
        database: databaseCubit.database!,
        id: id,
      );

      getCities(); // Instead of emitting InitCityState, trigger a load
    } catch (e) {
      log('Error removing city: $e');
    }
  }
}
