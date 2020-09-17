import 'package:flutter/material.dart';
import 'package:wabi_clone/texto_personalizado.dart';
 
class CategoriesPage extends StatelessWidget {
  String direccion;
  CategoriesPage(
    this.direccion
  );
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextoPersonalizado(
                "MI DIRECCIÓN DE ENTREGA",
                12,
                Colors.black38
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextoPersonalizado(
                    direccion,
                    14,
                    Colors.black87
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down), 
                    onPressed: (){
                    }
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black54),
                    Container(
                      margin: EdgeInsets.only(left: 5), 
                      child: TextoPersonalizado("Encuentra productos y marcas", 14, Colors.black54)
                    ),
                  ],
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Categorie("assets/images/frutas.png",   "frutas"  , screenWidth * 0.3, screenWidth * 0.4),
                  Categorie("assets/images/verduras.png", "verduras", screenWidth * 0.5, screenWidth * 0.4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categorie("assets/images/dulces.png",   "dulces"  , screenWidth * 0.5, screenWidth * 0.4),
                  Categorie("assets/images/bebidas.png",  "bebidas" , screenWidth * 0.3, screenWidth * 0.4)
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
  Categorie(
    this.rutaImagen,
    this.nombre,
    this.width,
    this.heigth
  );
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
                child: Image.asset(
                  rutaImagen,
                  fit: BoxFit.fill
                ),
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