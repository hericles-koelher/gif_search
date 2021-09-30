import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models.dart';

class GifGrid extends StatelessWidget {
  final List<ImageData> images;

  const GifGrid({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: images.length,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          imageUrl: images[index].url,
          progressIndicatorBuilder: (context, url, progress) {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
            );
          },
        );
      },
      staggeredTileBuilder: (int index) {
        // TODO: entender melhor como funciona esse tile...
        return const StaggeredTile.fit(1);
      },
    );
  }
}
