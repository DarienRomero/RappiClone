import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wabi_clone/core/models/category.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.grey[200].withOpacity(0.45),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black54,
            size: 18,
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "¿Qué quieres hoy?",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
