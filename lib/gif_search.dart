import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_search/src/blocs.dart';
import 'package:gif_search/src/screens.dart';

class GifSearch extends StatelessWidget {
  const GifSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagesBloc>(
      create: (context) => ImagesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey[600],
        ),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
