import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/constants/app_constants.dart';
import 'package:wabi_clone/core/core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Stack(
        children: [
          Consumer<AddressViewModel>(
            builder: (_, model, __) {
              return ListView(
                padding: EdgeInsets.only(top: 200),
                children: [
                  for (Address address in model.userAddressList)
                    ListTile(
                      title: Text(
                        address.description,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                      ),
                      subtitle: Text("Casa"),
                      leading: Icon(FontAwesomeIcons.home),
                      trailing: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.trashAlt,
                          size: 18,
                        ),
                        onPressed: () {
                          model.deleteAddress(address.id);
                        },
                      ),
                    ),
                ],
              );
            },
          ),
          Container(
              color: Colors.grey[100],
              height: 200,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      // alignment: Alignment.centerLeft,
                      icon: Icon(Icons.close),
                      // iconSize: 16,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Text(
                      "Agrega o escoge una dirección",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(RoutePaths.ChooseAddressScreen),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              spreadRadius: 2,
                              blurRadius: 9,
                              offset: Offset(0, 3),
                            )
                          ]),
                      width: 300,
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.location_on),
                          ),
                          Text(
                            "Ingresa una nueva dirección",
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
