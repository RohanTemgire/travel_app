
import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;

  final Color borderColor;
  String? text;
  IconData? icon;
  bool?isIcon;

  AppButtons(
      {Key? key,
      required this.size,
      required this.color,
      this.text = 'hi',
      this.icon,
      this.isIcon =false,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(15),
          color:backgroundColor),

          child: isIcon==false?Center(child: AppText(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
