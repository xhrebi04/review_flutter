import 'package:flutter/material.dart';
import 'package:review_flutter/presentation/theme/my_colors.dart';

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
              child: Text(title)),
        ),
      ],
    );
  }
}
