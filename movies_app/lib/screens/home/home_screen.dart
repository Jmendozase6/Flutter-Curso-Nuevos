import 'package:flutter/material.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/widgets/widgets.dart';

import '../../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Now Playing Movies
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            //Movies Slider
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populars',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
