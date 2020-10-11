import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/core.dart';
import '../category/categories_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: <Widget>[
          CategoriesPage(),
          // Scaffold(
          //   body: Center(child: Text("Página 1"))
          // ),
          // Scaffold(
          //   body: Center(child: Text("Página 1"))
          // ),
          Scaffold(body: Center(child: Text("Página 2"))),
          Scaffold(body: Center(child: Text("Página 3"))),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text("Principal")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                title: Text("Mis compras")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Perfil"))
          ]),
    );
  }
}
