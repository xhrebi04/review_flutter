import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:review_flutter/di/di.dart';
import 'package:review_flutter/screens/app/home/home_screen.dart';
import 'package:review_flutter/theme/my_colors.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Review Flutter App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: MyColors.white),
        home: const HomeScreen());
  }
}
