part of 'city_bloc.dart';

abstract class CityState {
  List<City> cities;
  CityState({required this.cities});
}

class CityInitial extends CityState {
  CityInitial({required super.cities});
}

class CityUpdated extends CityState {
  CityUpdated({required super.cities});
}
