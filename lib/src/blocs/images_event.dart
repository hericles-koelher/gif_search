part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class SearchImageEvent extends ImagesEvent {
  final String query;

  SearchImageEvent(String searchQuery)
      : assert(searchQuery.isNotEmpty),
        query = searchQuery.trim();

  @override
  List<Object?> get props => [query];
}
