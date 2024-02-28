part of 'image_bloc.dart';

@immutable
abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageFailure extends ImageState {}

class ImageSuccess extends ImageState {
  final String imageUrl;

  const ImageSuccess(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}
