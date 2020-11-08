import 'package:wabi_clone/core/models/category.dart';

abstract class CategoryServiceAbs {
  Future<List<ProductCategory>> getCategories();
}
