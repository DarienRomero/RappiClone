import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/core/models/category.dart';
import 'package:wabi_clone/core/viewmodels/category_model_view.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key key, this.allCategories}) : super(key: key);
  final List<ProductCategory> allCategories;

  @override
  Widget build(BuildContext context) {
    return Selector<CategoryModelView, List<ProductCategory>>(
      selector: (_, model) => model.categories,
      builder: (_, allCategories, __) {
        return Wrap(
          children: [
            for (ProductCategory category in allCategories)
              Container(
                width: 85,
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: category.colorcard,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Image.asset(category.path),
                      ),
                      Text(category.title),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
