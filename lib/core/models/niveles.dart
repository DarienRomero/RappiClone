import 'package:flutter/material.dart';

class Niveles extends ChangeNotifier{
  int _nivelInt = 1;
  String _nivelStr = "Bronce";
  int _puntaje = 200;

  get nivelInt => this._nivelInt;
  set nivelInt(int nivelInt){
    this._nivelInt = nivelInt;
  }

  get nivelStr => this._nivelStr;
  set nivelStr(String nivelStr){
    this._nivelStr = nivelStr;
  }
  get puntaje => this._puntaje;
  set puntaje(int puntaje){
    this._puntaje = puntaje;
  } 


}