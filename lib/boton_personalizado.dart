import 'package:flutter/material.dart';
class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final double width;
  final Color colorTexto;
  final double bottomMargin;
  final Color backgroundColor;
  BotonPersonalizado({
    this.texto,
    this.width,
    this.colorTexto,
    this.bottomMargin,
    this.backgroundColor
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(
            color: colorTexto,
            fontWeight: FontWeight.bold
          )
        )
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Color(0xff1de1fc), width: 2.0
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}