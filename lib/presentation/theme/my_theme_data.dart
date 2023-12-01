import 'package:flutter/material.dart';
import 'package:review_flutter/presentation/theme/my_colors.dart';

class MyTheme {
  ThemeData theme(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Satoshi',
        scaffoldBackgroundColor: MyColors.white,
        appBarTheme: appBarTheme());
  }

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: MyColors.black,
        centerTitle: true);
  }
}
