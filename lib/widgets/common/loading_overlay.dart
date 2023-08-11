import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_flutter/theme/my_colors.dart';

class LoadingOverlay {
  void hide() {
    Get.back();
  }

  void show() {
    BuildContext? context = Get.context;

    if (context != null) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: MyColors.black));
          },
          barrierDismissible: false);
    }
  }
}
