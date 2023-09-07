import 'package:flutter/material.dart';
import 'package:review_flutter/presentation/theme/my_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const MyAppBar({
    super.key,
    required this.title,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: MyColors.white, centerTitle: true, title: Text(title));
  }
}
