import 'package:flutter/material.dart';
import 'package:review_flutter/models/model.dart';
import 'package:review_flutter/theme/my_colors.dart';
import 'package:review_flutter/theme/my_shadows.dart';
import 'package:review_flutter/theme/my_text_style.dart';
import 'package:review_flutter/widgets/common/my_text.dart';

class ModelItem extends StatelessWidget {
  final Model model;

  const ModelItem({super.key, required this.model});

  Widget _renderName() {
    return MyText(
        text: model.name,
        style: MyTextStyle.satoshiBold.copyWith(fontSize: 14));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyColors.white,
            boxShadow: [MyShadows.primaryShadow]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: _renderName()),
        ));
  }
}
