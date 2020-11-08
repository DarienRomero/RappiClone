import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/viewmodels/category_model_view.dart';
import 'package:wabi_clone/ui/widgets/navigationBottom.dart';
import '../../../core/core.dart';
import 'tab_home.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryModelView>().getCategories();
    });
    super.initState();
  }

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
            TabHome(),
            Scaffold(body: Center(child: Text("Página 2"))),
            Scaffold(body: Center(child: Text("Página 3"))),
            Scaffold(body: Center(child: Text("Página 4"))),
            Scaffold(body: Center(child: Text("Página 5"))),
          ]),
        ),
        bottomNavigationBar: NavigationBottom());
  }
}
