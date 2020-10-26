import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:wabi_clone/core/abstract/address_service_abs.dart';
import 'package:wabi_clone/core/models/models.dart';

class AddressViewModel with ChangeNotifier {
  Address _currentAddress;
  Address get currentAddress => _currentAddress;

  List<Address> _predictions = [];

  List<Address> _userAddressList = [];

  List<Address> get predictions => _predictions;
  List<Address> get userAddressList => _userAddressList;
  Timer _timer;
  AddressServiceAbs _api;

  set api(AddressServiceAbs api) {
    _api = api;
    loadUserAddress();
  }

  getPredictionAddress(String text) async {
    // Search delay Search while typing
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    _timer = Timer(Duration(milliseconds: 300), () => _getPredictions(text));
  }

  _getPredictions(String text) async {
    _predictions = await _api.getPredictions(text);
    notifyListeners();
  }

  deleteAddress(String id) {
    _api.deleteAddress(id);
  }

  Future<bool> addAddress(Address address) async {
    return await _api.saveAddress(address);
  }

  loadUserAddress() {
    _api.getAddressList().listen((list) {
      _userAddressList = list;
      notifyListeners();
    });
    if (_userAddressList.isNotEmpty) _currentAddress = _userAddressList[0];
    notifyListeners();
  }
}
