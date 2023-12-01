part of 'movie_detail_cubit.dart';

class MovieDetailState {
  FetchStatus status;
  String errorMessage;
  MovieModel? movie;

  MovieDetailState(
      {this.status = FetchStatus.none, this.errorMessage = "", this.movie});

  MovieDetailState copyWith(
      {FetchStatus? status, String? errorMessage, MovieModel? movie}) {
    return MovieDetailState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        movie: movie ?? this.movie);
  }
}
