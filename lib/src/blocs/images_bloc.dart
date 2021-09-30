import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_search/src/models.dart';
import 'package:gif_search/src/repositories.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final ImageRepository _repository = ImageRepository();
  static final Map<String, List<ImageData>> cache = {};

  ImagesBloc() : super(const ImagesInitial()) {
    on<SearchImageEvent>(_search);
    on<TrendingImageEvent>(_trending);
  }

  void _search(SearchImageEvent event, Emitter<ImagesState> emit) async {
    emit(ImagesLoading(query: event.query));

    if (cache.containsKey(event.query)) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          emit(
            ImagesLoaded(
              images: cache[event.query]!,
              query: event.query,
            ),
          );
        },
      );
    }

    try {
      List<ImageData> images = await _repository.search(event.query);

      cache[event.query] = images;

      emit(
        ImagesLoaded(
          query: event.query,
          images: images,
        ),
      );
    } catch (error) {
      emit(ImagesError(query: event.query));
    }
  }

  void _trending(TrendingImageEvent event, Emitter<ImagesState> emit) async {}
}
