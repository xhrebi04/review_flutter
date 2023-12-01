import 'package:dio/dio.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/data/models/movie_model.dart';

class MovieRepository {
  final MovieApi movieAPI;

  MovieRepository({required this.movieAPI});

  Future<List<MovieModel>> getAllMovies() async {
    Response response = await movieAPI.getMoviesRequest();

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Fetch movies error');
    }
  }

  Future<MovieModel> getMovieDetail(int movieId) async {
    Response response = await movieAPI.getMovieDetailRequest(movieId);

    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw Exception('Fetch movies error');
    }
  }
}
