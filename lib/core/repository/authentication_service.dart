import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wabi_clone/core/abstract/abstract.dart';
import 'package:meta/meta.dart';

class AuthenticationService implements AuthenticationServiceAbs {
  AuthenticationService({
    @required this.auth,
    @required this.firestore,
  });

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  @override
  Future<User> handleSignIn() {
    if (auth.currentUser != null) {
      return Future.value(auth.currentUser);
    }
    return null;
  }

  @override
  Future<bool> logout() async {
    await auth.signOut();
    return true;
  }

  @override
  Stream<User> get onAuthStateChanged => auth.authStateChanges();

  @override
  Future<User> signInAnonymously() async {
    UserCredential credential = await auth.signInAnonymously();
    return credential.user;
  }
}
