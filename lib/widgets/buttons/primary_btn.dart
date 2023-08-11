import 'package:flutter/material.dart';
import 'package:review_flutter/theme/my_colors.dart';
import 'package:review_flutter/theme/my_text_style.dart';
import 'package:review_flutter/widgets/common/my_text.dart';

class PrimaryBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const PrimaryBtn({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 56,
          child: ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: MyText(
                  text: title,
                  style: MyTextStyle.satoshiBold
                      .copyWith(color: MyColors.white, fontSize: 16))),
        ),
      ],
    );
  }
}
