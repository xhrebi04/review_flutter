import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:review_flutter/data/client/api_client.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';
import 'package:review_flutter/presentation/screens/app/home/home_screen.dart';
import 'package:review_flutter/presentation/theme/my_colors.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  ApiClient apiClient = ApiClient();
  MovieApi movieAPI = MovieApi(apiClient.dio);

  runApp(MyApp(movieAPI: movieAPI));
}

class MyApp extends StatelessWidget {
  final MovieApi movieAPI;

  const MyApp({Key? key, required this.movieAPI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Review Flutter App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(scaffoldBackgroundColor: MyColors.white),
        home: RepositoryProvider(
            create: (context) => MovieRepository(movieAPI),
            child: const HomeScreen()));
  }
}
