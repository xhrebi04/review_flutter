part of 'movie_cubit.dart';

sealed class MovieState {
  const MovieState();
}

final class MovieFetchInProgress extends MovieState {}

final class MovieFetchSuccess extends MovieState {
  final List<MovieModel> movies;

  const MovieFetchSuccess(this.movies);
}

final class MovieFetchFailure extends MovieState {
  final String errorMsg;

  const MovieFetchFailure(this.errorMsg);
}
