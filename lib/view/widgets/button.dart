
import 'package:flutter/material.dart';

import 'customText.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Color buttonColor;
  final double fontSize;
  final Function onPressed;
  AuthButton(
      {this.text,
      this.fontColor,
      this.buttonColor,
      this.fontSize,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        color: Colors.green,
        padding: EdgeInsets.all(16),
        child: CustomText(
          text: text,
          color: fontColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
