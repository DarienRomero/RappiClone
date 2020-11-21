import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  @override
  _NavigationBottomState createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabBar(
        backgroundColor: Colors.transparent,
        activeColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(FontAwesomeIcons.home, size: 20),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.percentage, size: 20),
            label: "Promos",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search, size: 20),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.headset, size: 20),
            label: "Ayuda",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 20),
            label: "Mi perfil",
          ),
        ],
      );
    }

    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey[500],
      unselectedLabelStyle: TextStyle(color: Colors.grey[900]),
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(
          () {
            _currentIndex = index;
          },
        );
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Inicio", 
          icon: Icon(FontAwesomeIcons.home, size: 20),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.percentage, size: 20),
          label: "Promos", 
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.search,
            size: 20,
          ),
          label: "Buscar", 
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.headset, size: 20),
          label: "Ayuda",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user, size: 20),
          label: "Mi perfil" 
        ),
      ],
    );
  }
}
