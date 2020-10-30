import 'dart:ui';

import 'package:flutter/material.dart';

class RappiBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange[900].withOpacity(0.2),
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Rappi",
                    style: TextStyle(
                        fontFamily: "Steady",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TU SALDO",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4, right: 16),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 13,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 9,
                      spreadRadius: 3,
                      color: Colors.deepOrange[900].withOpacity(0.3)),
                ],
              ),
              child: Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
