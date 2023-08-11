import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_flutter/models/manufacturer_model.dart';
import 'package:review_flutter/screens/app/home/controller/home_screen_ctrl.dart';
import 'package:review_flutter/theme/my_colors.dart';
import 'package:review_flutter/theme/my_shadows.dart';
import 'package:review_flutter/theme/my_text_style.dart';
import 'package:review_flutter/widgets/common/my_text.dart';

class ManufacturerItem extends StatelessWidget {
  final ManufacturerModel manufacturer;

  const ManufacturerItem({super.key, required this.manufacturer});

  Widget _renderName() {
    return MyText(
        text: manufacturer.name,
        style: MyTextStyle.satoshiBold.copyWith(fontSize: 14));
  }

  Widget _renderCountry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: TextDirection.ltr,
      children: [
        const Icon(
          Icons.flag_outlined,
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(width: 8),
        MyText(
            text: manufacturer.country,
            style: MyTextStyle.satoshiMedium.copyWith(fontSize: 12))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenCtrl c = Get.find<HomeScreenCtrl>();

    return GestureDetector(
      onTap: () => c.onManufacturerItemPress(manufacturer),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyColors.white,
            boxShadow: [MyShadows.primaryShadow]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              _renderName(),
              const SizedBox(height: 4),
              _renderCountry()
            ],
          ),
        ),
      ),
    );
  }
}
