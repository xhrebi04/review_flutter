import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_flutter/theme/my_colors.dart';

class BottomSheetUtility {
  static void show({
    required Widget content,
    double maxHeightRatio = 0.5,
  }) {
    Get.bottomSheet(
      ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.height * maxHeightRatio),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: content,
        ),
      ),
      barrierColor: Colors.transparent.withOpacity(0.6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      backgroundColor: MyColors.white,
      isScrollControlled: true,
    );
  }
}
