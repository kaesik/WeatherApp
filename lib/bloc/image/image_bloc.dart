import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return 'tstorm';
      case >= 300 && < 400:
        return 'drizzle';
      case >= 500 && < 600:
        return 'rain';
      case >= 600 && < 700:
        return 'snow';
      case >= 700 && < 800:
        return 'fog';
      case == 800:
        return 'clear';
      case > 800 && <= 802:
        return 'pcloudy';
      case > 802 && <= 803:
        return 'mcloudy';
      case == 804:
        return 'cloudy';
      default:
        return 'clear';
    }
  }

  getDayNight(int hour) {
    switch (hour) {
      case >= 6 && < 18:
        return 'd';
      default:
        return 'n';
    }
  }

  ImageBloc() : super(ImageInitial()) {
    on<FetchImage>((event, emit) async {
      emit(ImageLoading());
      try {
        var mode = event.isDarkMode ? 'd' : 'l';
        var weather =
            getWeatherIcon(event.weather.weatherConditionCode!.toInt());
        var dayNight = getDayNight(event.weather.date!.hour.toInt());
        var imageUrl = 'assets/images/$mode-$weather-$dayNight.png';
        emit(ImageSuccess(imageUrl));
        print('/kaesik ImageSuccess: $imageUrl');
      } catch (error) {
        emit(ImageFailure());
        print('/kaesik ImageFailure: $error');
      }
    });
  }
}
