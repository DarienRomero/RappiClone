import 'package:flutter/material.dart';
import 'package:wabi_clone/core/viewmodels/category_model_view.dart';
import 'package:wabi_clone/ui/widgets/rappi_bank_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/tab_home_shimmer.dart';
import 'widgets/category_widget.dart';
import 'widgets/search_widget.dart';

class TabHome extends StatelessWidget {
  final List<Widget> countItems = List.generate(
    10,
    (index) => Container(
      margin: EdgeInsets.all(8),
      height: 90,
      width: 90,
      color: Colors.green,
      child: Center(
        child: Text("Item $index"),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Selector<CategoryModelView, CategoryState>(
      selector: (_, model) => model.categoryState,
      builder: (context, _state, _) {
        List<Widget> items = [
          RappiBank(),
          SearchWidget(),
          CategoryWidget(),
          Container(
            height: 30,
            color: Colors.green,
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (Widget item in countItems) item,
              ],
            ),
          ),
          CategoryWidget(),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (Widget item in countItems) item,
              ],
            ),
          ),
          CategoryWidget(),
        ];

        return AnimatedSwitcher(
          duration: Duration(seconds: 2),
          child: _state == CategoryState.Busy
              ? TabHomeShimmer()
              : Scaffold(
                  body: ListView(
                    padding: EdgeInsets.all(8),
                    children: [
                      for (Widget item in items) item,
                    ],
                  ),
                ),
        );
      },
    );
  }
}
