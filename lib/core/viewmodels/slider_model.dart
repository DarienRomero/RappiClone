import 'package:flutter/cupertino.dart';

class SliderModel with ChangeNotifier{
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }


}