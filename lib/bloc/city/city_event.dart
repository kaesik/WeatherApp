part of 'city_bloc.dart';

abstract class CityEvent {}

class AddCity extends CityEvent {
  final City city;

  AddCity({required this.city});
}

class DeleteCity extends CityEvent {
  final City city;

  DeleteCity({required this.city});
}

class UpdateCity extends CityEvent {
  final City city;

  UpdateCity({required this.city});
}
