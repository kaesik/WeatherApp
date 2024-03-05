import 'package:bloc/bloc.dart';
import 'package:weather_app/models/city.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial(cities: [])) {
    on<AddCity>(_addCity);
    on<DeleteCity>(_deleteCity);
    on<UpdateCity>(_updateCity);
  }
  void _addCity(AddCity event, Emitter<CityState> emit) {
    state.cities.add(event.city);
    emit(CityUpdated(cities: state.cities));
  }

  void _deleteCity(DeleteCity event, Emitter<CityState> emit) {
    state.cities.remove(event.city);
    emit(CityUpdated(cities: state.cities));
  }

  void _updateCity(UpdateCity event, Emitter<CityState> emit) {
    for (var i = 0; i < state.cities.length; i++) {
      if (state.cities[i].id == event.city.id) {
        state.cities[i] = event.city;
      }
      emit(CityUpdated(cities: state.cities));
    }
  }
}
