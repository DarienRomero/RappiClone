import 'package:flutter/material.dart';
import 'package:wabi_clone/core/abstract/category_service_abs.dart';
import 'package:meta/meta.dart';
import 'package:wabi_clone/core/models/category.dart';

enum CategoryState {
  Busy,
  Idle,
}

class CategoryModelView with ChangeNotifier {
  CategoryModelView({@required CategoryServiceAbs repository})
      : _repository = repository;
  final CategoryServiceAbs _repository;

  CategoryState _categoryState = CategoryState.Busy;
  CategoryState get categoryState => _categoryState;
  List<ProductCategory> _categories = [];
  List<ProductCategory> get categories => _categories;

  getCategories() async {
    _categoryState = CategoryState.Busy;
    notifyListeners();
    _categories = await _repository.getCategories();
    _categoryState = CategoryState.Idle;
    notifyListeners();
  }
}
