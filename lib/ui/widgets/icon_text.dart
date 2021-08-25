import 'package:flutter/material.dart';

class IconText extends StatelessWidget{
  final Icon? icon;
  final IconButton? iconButton;
  final double sizedBoxWidth;
  final Text text;

  const IconText({
    required this.text,
    this.sizedBoxWidth = 8.0,
    this.icon,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon ?? iconButton?? Container(),

        SizedBox(width: sizedBoxWidth,),

        text,
      ],
    );
  }
}