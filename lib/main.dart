import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wabi_clone/provider_setup.dart';

import 'constants/app_constants.dart';
import 'ui/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(title: 'Wabi Clone', home: OnboardingPage());

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Wabi Clone',
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generateRoute,
        onUnknownRoute: Router.onUnknownRoute,
      ),
    );
  }
}
