import '../../core/core.dart';

import 'login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding/onboarding_view.dart';

class SplashView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (_, UserViewModel model, Widget child) {
        if (model.isLoading)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );

        if (model.currentUser != null) return OnboardingView();

        return LoginView();
      },
    );
  }
}
