import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/app_pages.dart';
import 'package:wabi_clone/boton_personalizado.dart';
import 'package:wabi_clone/slider_model.dart';
import 'package:wabi_clone/texto_personalizado.dart';
import 'package:wabi_clone/slideshow.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            //SingleChildScrollView es para evitar que los elementos se desborder por la parte
            //inferior de la pantalla
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextoPersonalizado("Wabi Clone", 24, Colors.black),
                    SlideShow(),
                    _Dots(),
                    Container(height: 20),
                    BotonPersonalizado(
                        texto: "Usar dirección actual",
                        width: MediaQuery.of(context).size.width * 0.7,
                        colorTexto: Colors.white,
                        bottomMargin: 20,
                        backgroundColor: Color(0xff1de1fc),
                        destino: AppPages()),
                    BotonPersonalizado(
                        texto: "Usar dirección diferente",
                        width: MediaQuery.of(context).size.width * 0.7,
                        colorTexto: Colors.grey,
                        bottomMargin: 20,
                        backgroundColor: Colors.white,
                        destino: AppPages()),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final double pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? 14
            : 12,
        height: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? 14
            : 12,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
                ? Colors.blue
                : Colors.grey));
  }
}
