import 'package:flutter/material.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class ChooseAddress extends StatelessWidget {
  final List<Address> direcciones = [
    Address(
      direccion: "Jiron Carlos Alaiza",
      tipo: "Otro",
      isSelected: true
    ),
    Address(
      direccion: "Avenida paseo de la república 2736",
      tipo: "Casa",
      isSelected: true
    ),
    Address(
      direccion: "José María Eguren 151",
      tipo: "Casa",
      isSelected: true
    ),
    Address(
      direccion: "Avenida Petit Thouars 315",
      tipo: "Trabajo",
      isSelected: true
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextoPersonalizado("Agrega o escoge\nuna dirección", 18, Colors.black),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: ListView(
        children: [
          SearchBox(),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Icon(
                Icons.directions,
                size: 20,
                color: Colors.green
              ),
              title: TextoPersonalizado(
                "Activar direccion actual",
                18,
                Colors.black
              )
            ),
          ),
          ListView.builder(
            itemCount: direcciones.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(direcciones[index].direccion),
                subtitle: Text(direcciones[index].tipo),
                leading: icono(direcciones[index].tipo),
                trailing: direcciones[index].isSelected ? Icon(Icons.check_circle_outline) : Container(),
              );
            },
          ),
        ],
      ),
    );
  }
  Widget icono(String tipo){
    if(tipo == "Casa"){
      return Icon(Icons.home);
    }else if(tipo == "Trabajo"){
      return Icon(Icons.work);
    }else{
      return Icon(Icons.location_on);
    }
  }
}

class SearchBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            hintText: "Ingresa una nueva direccion",
            contentPadding: EdgeInsets.all(10),
            fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
class Address{
  String direccion;
  String tipo;
  bool isSelected;
  Address({
    this.direccion,
    this.tipo,
    this.isSelected
  });
}