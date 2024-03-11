part of 'city_cubit.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object?> get props => [];
}

class CityInitial extends CityState {}

class CityLoadSuccess extends CityState {
  final List<City> cities;

  const CityLoadSuccess(this.cities);

  @override
  List<Object?> get props => [cities];
}

class CityLoadFailure extends CityState {}
