import 'package:dio/dio.dart';

class MovieApi {
  Dio dio;

  MovieApi(this.dio);

  Future<Response> getMoviesRequest() async {
    return await dio.get('/movies');
  }
}
