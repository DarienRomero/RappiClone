import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/models/address.dart';
import 'package:wabi_clone/core/viewmodels/address_model_view.dart';
import 'package:wabi_clone/ui/widgets/rappi_bank_widget.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class Category {
  final String path;
  final String title;
  final Color colorcard;

  Category(this.path, this.title, this.colorcard);
}

class CategoriesPage extends StatelessWidget {
  final List<Category> category = [
    Category("assets/images/fruta.png", "Frutas", Colors.purple[50]),
    Category("assets/images/verdura.png", "Verduras", Colors.deepOrange[50]),
    Category("assets/images/dulce.png", "Dulces", Colors.amber[50]),
    Category("assets/images/bebida.png", "Bebidas", Colors.red[50]),
    Category("assets/images/farmacia.png", "Farmacia", Colors.blue[50]),
    Category("assets/images/veterinaria.png", "Veterinaria",
        Colors.orangeAccent[50]),
    Category("assets/images/currier.png", "Courier", Colors.pink[50]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // TextoPersonalizado("MI DIRECCIÓN DE ENTREGA", 12, Colors.black38),
              RappiBank(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey[200].withOpacity(0.45),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 18,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextoPersonalizado(
                        "¿Qué quieres hoy?", 
                        16, 
                        Colors.black54,
                        FontWeight.normal,
                        TextAlign.center
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  for (var category in category)
                    Container(
                      width: 85,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: category.colorcard,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Image.asset(category.path),
                            ),
                            Text(category.title),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
