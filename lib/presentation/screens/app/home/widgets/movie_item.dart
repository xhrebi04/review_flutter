import 'package:flutter/material.dart';
import 'package:review_flutter/data/models/movie_model.dart';
import 'package:review_flutter/presentation/router/screen-arguments/movie_detail_screen_arguments.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;

  const MovieItem({super.key, required this.movie});

  void onItemPress(BuildContext context) {
    Navigator.of(context).pushNamed('/movie-detail',
        arguments: MovieDetailScreenArguments(movieId: movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () => onItemPress(context), child: Text(movie.movie)),
    );
  }
}
