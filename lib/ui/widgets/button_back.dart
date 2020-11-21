import 'package:flutter/material.dart';
class ButtonBack extends StatefulWidget {
  
  final BuildContext context;

  ButtonBack(
    this.context
  );

  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return InkWell( 
      child: Icon(
        Icons.arrow_back,
        size: 30,
        color: Colors.greenAccent
      ), 
      onTap: (){
        Navigator.pop(widget.context);
      }
    );
  }
}