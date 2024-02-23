import 'package:get_it/get_it.dart';
import 'package:review_flutter/data/client/api_client.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';

final getIt = GetIt.instance;

class Di {
  static void setup() {
    _registerApiClient();
    _registerDataProviders();
    _registerRepositories();
  }

  static void _registerApiClient() {
    getIt.registerSingleton<ApiClient>(ApiClient());
  }

  static void _registerDataProviders() {
    getIt.registerSingleton<MovieApi>(MovieApi(getIt.get<ApiClient>().dio));
  }

  static void _registerRepositories() {
    getIt.registerSingleton<MovieRepository>(
        MovieRepository(movieAPI: getIt.get<MovieApi>()));
  }
}
