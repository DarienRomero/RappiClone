import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationServiceAbs {
  Future<User> signInAnonymously();
  Future<bool> logout();
  Future<User> handleSignIn();
  Stream<User> get onAuthStateChanged;
}
