import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/core.dart';

class AddressView extends StatefulWidget {
  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  initState() {
    super.initState();
    Provider.of<AddressViewModel>(context, listen: false).loadUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis direcciones"),
      ),
      body: Consumer<AddressViewModel>(
        builder: (_, model, __) {
          return ListView(
            children: [
              for (Address address in model.userAddressList)
                ListTile(
                  title: Text(address.description),
                  // subtitle: Text(direcciones[index].tipo),
                  leading: Icon(Icons.location_on),
                  trailing: Icon(Icons.delete),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.of(context).pushNamed(RoutePaths.ChooseAddressScreen),
        label: Text('Agregar'),
        icon: Icon(Icons.location_on),
      ),
    );
  }
}
