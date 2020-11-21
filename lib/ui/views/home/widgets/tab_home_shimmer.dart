import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TabHomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            children: [
              for (var i in [1, 2, 3, 4, 5]) ...[
                Container(
                  height: 85,
                  width: 85,
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                // SizedBox(
                //   width: 8,
                // ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
