import 'package:dio/dio.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/data/models/movie_model.dart';

class MovieRepository {
  final MovieApi movieAPI;

  MovieRepository({required this.movieAPI});

  Future<List<MovieModel>> getAllMovies() async {
    Response response = await movieAPI.getMoviesRequest();
    return (response.data as List).map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<MovieModel> getMovieDetail(int movieId) async {
    Response response = await movieAPI.getMovieDetailRequest(movieId);
    return MovieModel.fromJson(response.data);
  }
}
