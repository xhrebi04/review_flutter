import 'package:flutter/material.dart';
import 'package:review_flutter/presentation/theme/my_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(color: MyColors.black));
  }
}
