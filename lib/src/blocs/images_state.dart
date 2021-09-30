part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  final String query;

  const ImagesState(this.query);
}

class ImagesInitial extends ImagesState {
  const ImagesInitial() : super("");

  @override
  List<Object> get props => [];
}

class ImagesLoading extends ImagesState {
  const ImagesLoading({required String query}) : super(query);

  @override
  List<Object> get props => [];
}

class ImagesLoaded extends ImagesState {
  final List<ImageData> images;

  const ImagesLoaded({required this.images, required String query})
      : super(query);

  @override
  List<Object?> get props => [images];
}

class ImagesError extends ImagesState {
  const ImagesError({required String query}) : super(query);

  @override
  List<Object> get props => [];
}
