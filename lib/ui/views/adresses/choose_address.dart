import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/core.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

import 'widgets/search_box.dart';

class ChooseAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextoPersonalizado(
              "Agrega o escoge\nuna dirección", 18, Colors.black, FontWeight.normal, TextAlign.center),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Consumer<AddressViewModel>(
        builder: (_, AddressViewModel model, __) {
          return ListView(
            children: [
              SearchBox(),
              for (Address address in model.predictions)
                ListTile(
                  title: Text(address.description),
                  leading: Icon(Icons.location_on),
                  onTap: () async {
                    if (await model.addAddress(address))
                      Navigator.of(context).pushNamed(RoutePaths.AddressScreen);
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
