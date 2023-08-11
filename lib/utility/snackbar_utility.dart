import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/theme/my_colors.dart';
import 'package:review_flutter/theme/my_text_style.dart';
import 'package:review_flutter/widgets/common/my_text.dart';

enum SnackbarType { sucess, error }

class SnackbarUtility {
  static void show(
      {String? title,
      required String message,
      SnackbarType type = SnackbarType.sucess,
      SnackPosition snackPosition = SnackPosition.TOP}) {
    Color color;

    switch (type) {
      case SnackbarType.sucess:
        color = MyColors.green;
        break;
      case SnackbarType.error:
        color = MyColors.red;
        break;
      default:
        color = MyColors.green;
    }

    String titleText = title ?? S.current.warning;

    BuildContext? context = Get.overlayContext;
    if (context != null) {
      Get.snackbar(titleText, message,
          backgroundColor: color,
          snackPosition: snackPosition,
          duration: const Duration(seconds: 5),
          titleText: MyText(
              text: titleText,
              style: MyTextStyle.satoshiBold.copyWith(fontSize: 16)),
          messageText: MyText(
              text: message,
              style: MyTextStyle.satoshiMedium.copyWith(fontSize: 14)));
    }
  }
}
