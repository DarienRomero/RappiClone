import 'package:flutter/cupertino.dart';

class Pages extends ChangeNotifier{
  int _page = 0;
  get page => this._page;
  
  set page(int page){
    this._page = page;
    notifyListeners();
  }
}