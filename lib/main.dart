import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:review_flutter/data/client/api_client.dart';
import 'package:review_flutter/data/data_providers/movie/movie_api.dart';
import 'package:review_flutter/presentation/router/app_router.dart';
import 'package:review_flutter/presentation/theme/my_theme_data.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  // Define API client/s
  ApiClient apiClient = ApiClient();

  // Define API sources
  MovieApi movieAPI = MovieApi(apiClient.dio);

  // Define App Router
  // Pass all API sources through constructor or use some DI library
  final AppRouter appRouter = AppRouter(movieAPI: movieAPI);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

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
        theme: MyTheme().theme(context),
        onGenerateRoute: appRouter.onGenerateRoute);
  }
}
