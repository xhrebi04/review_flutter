import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';
import 'package:review_flutter/logic/cubit/home_cubit.dart';
import 'package:review_flutter/logic/cubit/movie_detail_cubit.dart';
import 'package:review_flutter/presentation/router/screen-arguments/movie_detail_screen_arguments.dart';
import 'package:review_flutter/presentation/screens/app/home/home_screen.dart';
import 'package:review_flutter/presentation/screens/app/movie-detail/movie_detail_screen.dart';

class AppRouter {
  final MovieApi movieAPI;

  AppRouter({required this.movieAPI});

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider(
                  create: (context) => MovieRepository(movieAPI: movieAPI),
                  child: BlocProvider(
                    create: (context) => HomeCubit(
                        movieRepository: context.read<MovieRepository>())
                      ..fetchMovies(),
                    child: const HomeScreen(),
                  ),
                ));

      case '/movie-detail':
        final args = routeSettings.arguments as MovieDetailScreenArguments;

        return MaterialPageRoute(
            builder: (_) => RepositoryProvider(
                  create: (context) => MovieRepository(movieAPI: movieAPI),
                  child: BlocProvider(
                    create: (context) => MovieDetailCubit(
                        movieRepository: context.read<MovieRepository>())
                      ..fetchMovieDetail(args.movieId),
                    child: const MovieDetailScreen(),
                  ),
                ));
      default:
        return null;
    }
  }
}
