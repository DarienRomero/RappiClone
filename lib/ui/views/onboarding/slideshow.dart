import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/core/viewmodels/slider_model.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class SlideShow extends StatefulWidget {
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  PageController pageController = new PageController();

  @override
  void initState() {
    pageController.addListener(() {
      //print(pageController.page);
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 350,
        child: PageView(controller: pageController, children: <Widget>[
          _Slide("assets/images/slide1.png",
              "Wabi Clone es una aplicación que permite comprar productos de bodegas cercanas."),
          _Slide(
            "assets/images/slide2.png",
            "Para comprar, simplemente busca los productos de tu interés y añadelos al carrito.",
          ),
          _Slide("assets/images/slide3.png",
              "Wabi Clone se encargará de enviarte los productos comprados hasta tu domicilio."),
        ]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String ruta;
  final String descripcion;
  _Slide(this.ruta, this.descripcion);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            child: Image(image: AssetImage(ruta))),
        TextoPersonalizado(descripcion, 16, Colors.grey, FontWeight.normal, TextAlign.center),
      ],
    );
  }
}
