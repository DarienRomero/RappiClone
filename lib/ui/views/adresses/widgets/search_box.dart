import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/core/core.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            hintText: "Ingresa una nueva direccion",
            contentPadding: EdgeInsets.all(10),
            fillColor: Colors.white,
          ),
          onChanged: (String value) {
            Provider.of<AddressViewModel>(context, listen: false)
                .getPredictionAddress(value);
          },
        ),
      ),
    );
  }
}
