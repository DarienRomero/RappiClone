import 'package:flutter/material.dart';

class TextoPersonalizado extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign alignment;
  TextoPersonalizado(this.text, this.textSize, this.textColor, this.fontWeight, this.alignment);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        fontSize: textSize, 
        color: textColor,
        fontWeight: fontWeight
      ),
    );
  }
}
