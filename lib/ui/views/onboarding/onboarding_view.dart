import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/ui/widgets/boton_personalizado.dart';
import 'package:wabi_clone/core/viewmodels/slider_model.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';
import 'package:wabi_clone/ui/views/onboarding/slideshow.dart';

import '../home/home_view.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
                  TextoPersonalizado("Rappi Clone", 24, Colors.black, FontWeight.normal, TextAlign.center),
                  SlideShow(),
                  _Dots(),
                  Container(height: 20),
                  BotonPersonalizado(
                    texto: "Usar dirección actual",
                    width: MediaQuery.of(context).size.width * 0.7,
                    colorTexto: Colors.white,
                    bottomMargin: 20,
                    backgroundColor: Color(0xff1de1fc),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutePaths.Home,
                      );
                    },
                  ),
                  BotonPersonalizado(
                    texto: "Usar dirección diferente",
                    width: MediaQuery.of(context).size.width * 0.7,
                    colorTexto: Colors.grey,
                    bottomMargin: 20,
                    backgroundColor: Colors.white,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutePaths.Home,
                      );
                    },
                  ),
                ]
              ),
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
