part of 'image_bloc.dart';

@immutable
abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class FetchImage extends ImageEvent {
  final Weather weather;
  final bool isDarkMode;

  const FetchImage(this.weather, this.isDarkMode);

  @override
  List<Object> get props => [weather];
}
