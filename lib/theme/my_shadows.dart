import 'package:flutter/material.dart';
import 'package:review_flutter/theme/my_colors.dart';

class MyShadows {
  static BoxShadow primaryShadow = BoxShadow(
    color: MyColors.black.withAlpha(50),
    spreadRadius: 0,
    blurRadius: 8,
    offset: const Offset(0, 4),
  );
}
