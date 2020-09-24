import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/core.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Provider.of<UserViewModel>(context, listen: false).signInAnon();
          },
          child: Text("Login anonymously"),
        ),
      ),
    );
  }
}
