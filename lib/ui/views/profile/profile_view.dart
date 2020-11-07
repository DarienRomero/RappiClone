import 'package:flutter/material.dart';
import 'package:wabi_clone/ui/views/profile/edit_profile.dart';
import 'package:wabi_clone/ui/views/profile/edit_profile_old.dart';
import 'package:wabi_clone/ui/widgets/chip_nivel.dart';

import '../../widgets/texto_personalizado.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:50, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextoPersonalizado("Hola", 18, Colors.black54, FontWeight.normal, TextAlign.center),
                TextoPersonalizado("Darien", 22, Colors.black.withOpacity(0.7), FontWeight.bold, TextAlign.center),
                Container(height: 20),
                ChipNivel("Bronce", Icons.assignment_ind, Icons.keyboard_arrow_right),
                Container(height: 15),
                PoolOpciones(),
                Container(height: 25),
                CardPromocion(),
                Column(
                  children: [
                    Opcion("RappiPay", Icons.assistant_photo),
                    Divider(),
                    Opcion("RappiPrime", Icons.assistant_photo),
                    Divider(),
                    Opcion("Direcciones", Icons.assistant_photo),
                    Divider(),
                    Opcion("Datos de facturación", Icons.assistant_photo),
                    Divider(),
                    Opcion("Centro de notificaciones", Icons.assistant_photo),
                    Divider(),
                    Opcion("Membresías y puntos", Icons.assistant_photo),
                    Divider(),
                  ]
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class Opcion extends StatelessWidget {
  final String textoOpcion;
  final IconData leading;

  Opcion(
    this.textoOpcion,
    this.leading
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(leading)
          ),
          Text(textoOpcion),
          Expanded(child: Container()),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54
          )
        ],
      ),
    );
  }
}

class CardPromocion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [Color(0xff11A48A), Color(0xff11A48A), Color(0xff004f9F)],
          // stops: [0.3, 0,6, 1],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Container(
            width: 160,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextoPersonalizado("Gana hasta S/12", 18, Colors.white, FontWeight.bold, TextAlign.center),
                  TextoPersonalizado("Por cada amigo que invites", 14, Colors.white, FontWeight.normal, TextAlign.center),
                ]
              ),
            ),
          ),
          Container(width: 15),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff0046a3).withOpacity(0.5)
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white
            ),
          ),
          Container(width: 10)
        ],
      ),
    );
  }
}

class PoolOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
            },
            child: Container(
              width: 70,
              height: 130,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.grey[100], Colors.white],
                        stops: [0.3, 1],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter
                      ),
                    ),
                    child: Icon(Icons.person_outline),
                  ),
                  Flexible(child: TextoPersonalizado("Datos de perfil", 16, Colors.black.withOpacity(0.7), FontWeight.w400, TextAlign.center)),
                ],
              ),
            ),
          ),
          Container(
            width: 70,
            height: 130,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.grey[100], Colors.white],
                      stops: [0.3, 1],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter
                    ),
                  ),
                  child: Icon(Icons.person_outline),
                ),
                Flexible(child: TextoPersonalizado("Centro de ayuda", 16, Colors.black.withOpacity(0.7), FontWeight.w400, TextAlign.center)),
              ],
            ),
          ),
          Container(
            width: 70,
            height: 130,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.grey[100], Colors.white],
                      stops: [0.3, 1],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter
                    ),
                  ),
                  child: Icon(Icons.person_outline),
                ),
                Flexible(child: TextoPersonalizado("Historial de pedidos", 16, Colors.black.withOpacity(0.7), FontWeight.w400, TextAlign.center)),
              ],
            ),
          ),
          Container(
            width: 70,
            height: 130,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.grey[100], Colors.white],
                      stops: [0.3, 1],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter
                    ),
                  ),
                  child: Icon(Icons.person_outline),
                ),
                Flexible(child: TextoPersonalizado("Métodos de pago", 16, Colors.black.withOpacity(0.7), FontWeight.w400, TextAlign.center)),
              ],
            ),
          ),
        ],
      ),  
    );
  }
}
