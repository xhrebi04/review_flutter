import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/data/models/movie_model.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository movieRepository;

  MovieCubit(this.movieRepository) : super(MovieFetchInProgress());

  void fetchMovies() async {
    try {
      List<MovieModel> m = await movieRepository.getAllMovies();
      emit(MovieFetchSuccess(m));
    } catch (err) {
      emit(MovieFetchFailure(err.toString()));
    }
  }
}
