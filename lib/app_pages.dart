import 'package:flutter/material.dart';
 
class AppPages extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPages> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            // CategoriesPage(),
            // Scaffold(
            //   body: Center(child: Text("Página 1"))
            // ),
            Scaffold(
              body: Center(child: Text("Página 1"))
            ),
            Scaffold(
              body: Center(child: Text("Página 2"))
            ),
            Scaffold(
              body: Center(child: Text("Página 3"))
            ),
          ]
        ),
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
            icon: Icon(Icons.search),
            title: Text("Principal")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("Mis compras")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil")
          )
        ]
      ),
    );
  } 
}