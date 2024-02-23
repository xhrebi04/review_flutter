import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/data/models/movie_model.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';
import 'package:review_flutter/enums/enums.dart';
import 'package:review_flutter/logic/utils/error_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieRepository movieRepository;

  HomeCubit({required this.movieRepository}) : super(HomeState());

  void fetchMovies() async {
    try {
      emit(state.copyWith(status: FetchStatus.fetching));
      List<MovieModel> m = await movieRepository.getAllMovies();
      emit(state.copyWith(status: FetchStatus.success, movies: m));
    } catch (error) {
      emit(state.copyWith(
          status: FetchStatus.failure,
          errorMessage: ErrorService.getErrorMsg(error)));
    }
  }
}
