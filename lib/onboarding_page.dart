import 'package:flutter/material.dart';
import 'package:wabi_clone/boton_personalizado.dart';
import 'package:wabi_clone/texto_personalizado.dart';
import 'package:wabi_clone/slideshow.dart';
 
class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          //SingleChildScrollView es para evitar que los elementos se desborder por la parte
          //inferior de la pantalla
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextoPersonalizado("Wabi Clone", 24, Colors.black),
                SlideShow(),
                BotonPersonalizado(
                  texto: "USAR DIRECCIÓN ACTUAL",
                  width: MediaQuery.of(context).size.width * 0.7,
                  colorTexto: Colors.white,
                  bottomMargin: 20,
                  backgroundColor: Color(0xff1de1fc),
                ),
                BotonPersonalizado(
                  texto: "USAR DIRECCIÓN DIFERENTE",
                  width: MediaQuery.of(context).size.width * 0.7,
                  colorTexto: Colors.grey,
                  bottomMargin :20,
                  backgroundColor: Colors.white,
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}