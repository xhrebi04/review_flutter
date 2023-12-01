part of 'home_cubit.dart';

class HomeState {
  FetchStatus status;
  String errorMessage;
  List<MovieModel> movies;

  HomeState(
      {this.status = FetchStatus.none,
      this.errorMessage = "",
      this.movies = const []});

  HomeState copyWith(
      {FetchStatus? status, String? errorMessage, List<MovieModel>? movies}) {
    return HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        movies: movies ?? this.movies);
  }
}
