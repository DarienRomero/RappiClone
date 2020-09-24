import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:wabi_clone/core/enums/viewstate.dart';
import 'package:wabi_clone/core/models/models.dart';
import 'package:wabi_clone/core/repository/repository.dart';

import 'base_model.dart';
import '../abstract/abstract.dart';

class UserViewModel extends BaseModel {
  AuthenticationServiceAbs _repository;
  User _currentUser;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  AuthenticationService get authenticationService => _repository;
  User get currentUser => _currentUser;

  // set authenticationService(AuthenticationService authenticationService) {
  //   _repository = authenticationService;
  //   notifyListeners();
  // }

  set authenticationService(AuthenticationService authenticationService) {
    _repository = authenticationService;

    _repository.onAuthStateChanged.listen((User userApp) {
      if (userApp == null) {
        _isLoading = false;
        notifyListeners();
      }
    });

    notifyListeners();
  }

  set currentUser(user) {
    if (_currentUser == user) return;

    if (_currentUser == null) {
      _currentUser = user;
      _handleSignIn();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future _handleSignIn() async {
    try {
      setState(ViewState.Busy);
      _currentUser = await _repository.handleSignIn();
      // loadUserData();
    } on PlatformException catch (error) {
      // errorMessage = '${error.message}';
      setState(ViewState.Idle);
    }
  }

  Future signInAnon() async {
    await _repository.signInAnonymously();
  }
}
