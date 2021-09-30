import 'package:dio/dio.dart';
import 'package:gif_search/src/config.dart';
import 'package:gif_search/src/models.dart';

// TODO: adicionar uma exceção menos generica...

class ImageRepository {
  final Dio _dio = Dio();

  Future<List<ImageData>> search(String query) async {
    var response = await _dio.get(
      giphySearchUrl,
      queryParameters: {"api_key": giphyAPIKey, "q": query},
    );

    if (response.statusCode == 200) {
      List<ImageData> images = [];

      for (var image in response.data["data"]) {
        images.add(
          ImageData(
            title: image["title"],
            url: image["images"]["fixed_height"]["url"],
          ),
        );
      }

      return images;
    } else {
      throw Exception(
        "Response:\n\tStatus code: ${response.statusCode}\n\tStatus message: ${response.statusMessage}",
      );
    }
  }
}
