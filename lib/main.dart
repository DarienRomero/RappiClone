import 'package:flutter/material.dart';
import 'package:wabi_clone/onboarding_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wabi Clone',
      home: OnboardingPage()
    );
  }
}
