import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';
import '../widgets.dart';

class SearchScreen extends StatelessWidget {
  final String query;

  const SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 5),
              child: SearchTextField(
                initialText: query,
                onSubmitted: (query) {
                  context.read<ImagesBloc>().add(
                        SearchImageEvent(query),
                      );
                },
              ),
            ),
            BlocBuilder<ImagesBloc, ImagesState>(
              builder: (context, state) {
                if (state is ImagesLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is ImagesLoaded) {
                  return Expanded(
                    child: GifGrid(
                      images: state.images,
                    ),
                  );
                }

                // state is ImagesError
                return const Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
