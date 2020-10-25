import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Selector<AddressViewModel, Address>(
          selector: (_, model) => model.currentAddress,
          builder: (_, address, __) {
            final String text =
                address?.description ?? 'Selecciona una dirección';
            return ListTile(
              title: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              leading: Icon(Icons.location_on),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePaths.AddressScreen);
                },
              ),
            );
          },
        ),
      ),
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
