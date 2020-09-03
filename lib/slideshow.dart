import 'package:flutter/material.dart';
import 'package:wabi_clone/texto_personalizado.dart';
class SlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 350,
        child: PageView(
          children: <Widget>[
            _Slide(
              "assets/images/slide1.png",
              "imagen 1"
            ),
            _Slide(
              "assets/images/slide2.png",
              "imagen 2"
            ),
            _Slide(
              "assets/images/slide3.png",
              "imagen 3"
            ),
          ]
        ),
      ),
    );
  }
}
class _Slide extends StatelessWidget {
  final String ruta;
  final String descripcion;
  _Slide(
    this.ruta,
    this.descripcion
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextoPersonalizado(descripcion, 18, Colors.grey),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          child: Image(
            image: AssetImage(ruta)
          )
        ),
      ],
    );
  }
}