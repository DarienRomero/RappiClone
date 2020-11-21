import 'package:flutter/material.dart';
import 'package:wabi_clone/core/abstract/category_service_abs.dart';
import 'package:wabi_clone/core/models/category.dart';

class CategoryService implements CategoryServiceAbs {
  @override
  Future<List<ProductCategory>> getCategories() async {
    await Future.delayed(Duration(seconds: 2));

    return allCategories;
  }

  final List<ProductCategory> allCategories = [
    ProductCategory("assets/images/fruta.png", "Frutas", Colors.purple[50]),
    ProductCategory(
        "assets/images/verdura.png", "Verduras", Colors.deepOrange[50]),
    ProductCategory("assets/images/dulce.png", "Dulces", Colors.amber[50]),
    ProductCategory("assets/images/bebida.png", "Bebidas", Colors.red[50]),
    ProductCategory("assets/images/farmacia.png", "Farmacia", Colors.blue[50]),
    ProductCategory("assets/images/veterinaria.png", "Veterinaria",
        Colors.orangeAccent[50]),
    ProductCategory("assets/images/currier.png", "Courier", Colors.pink[50]),
  ];
}
