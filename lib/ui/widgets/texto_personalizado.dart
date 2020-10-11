import 'package:flutter/material.dart';

class TextoPersonalizado extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  TextoPersonalizado(this.text, this.textSize, this.textColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: textSize, color: textColor),
      ),
    );
  }
}
