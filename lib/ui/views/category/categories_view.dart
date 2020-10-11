import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/models/address.dart';
import 'package:wabi_clone/core/viewmodels/address_model_view.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextoPersonalizado("MI DIRECCIÓN DE ENTREGA", 12, Colors.black38),
              Selector<AddressViewModel, Address>(
                selector: (_, model) => model.currentAddress,
                builder: (_, address, __) {
                  final String text =
                      address?.description ?? 'Selecciona una dirección';
                  return ListTile(
                    title: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RoutePaths.AddressScreen);
                      },
                    ),
                  );
                },
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black54),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: TextoPersonalizado(
                              "Encuentra productos y marcas",
                              14,
                              Colors.black54)),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Categorie("assets/images/frutas.png", "frutas",
                      screenWidth * 0.3, screenWidth * 0.4),
                  Categorie("assets/images/verduras.png", "verduras",
                      screenWidth * 0.5, screenWidth * 0.4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categorie("assets/images/dulces.png", "dulces",
                      screenWidth * 0.5, screenWidth * 0.4),
                  Categorie("assets/images/bebidas.png", "bebidas",
                      screenWidth * 0.3, screenWidth * 0.4)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categorie extends StatelessWidget {
  final String rutaImagen;
  final String nombre;
  final double width;
  final double heigth;
  Categorie(this.rutaImagen, this.nombre, this.width, this.heigth);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black54,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: width,
            height: heigth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: FittedBox(
              child: Hero(
                tag: rutaImagen,
                child: Image.asset(rutaImagen, fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(nombre),
          )
        ],
      ),
    );
  }
}
