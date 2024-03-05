part of 'city_cubit.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class InitCityState extends CityState {
  final int counter;

  const InitCityState(this.counter);

  @override
  List<Object> get props => [counter];
}

class AddCityState extends CityState {}

class RemoveCityState extends CityState {}
