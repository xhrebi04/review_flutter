import 'package:flutter/widgets.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextDirection? textDirection;

  const MyText(
      {super.key,
      required this.text,
      this.style,
      this.textDirection = TextDirection.ltr});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: textDirection,
      style: style,
    );
  }
}
