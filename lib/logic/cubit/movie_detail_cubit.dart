import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/data/models/movie_model.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';
import 'package:review_flutter/enums/enums.dart';
import 'package:review_flutter/logic/utils/error_service.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailCubit({required this.movieRepository}) : super(MovieDetailState());

  void fetchMovieDetail(int movieId) async {
    try {
      emit(state.copyWith(status: FetchStatus.fetching));
      MovieModel? m = await movieRepository.getMovieDetail(movieId);
      emit(state.copyWith(status: FetchStatus.success, movie: m));
    } catch (error) {
      emit(state.copyWith(
          status: FetchStatus.failure,
          errorMessage: ErrorService.getErrorMsg(error)));
    }
  }
}
