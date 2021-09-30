import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';
import '../screens.dart';
import '../widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "GIF Search",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 25,
                ),
                SearchTextField(
                  onSubmitted: (query) {
                    context.read<ImagesBloc>().add(
                          SearchImageEvent(query),
                        );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchScreen(
                          query: query,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
