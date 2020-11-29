import 'package:flutter/material.dart';
import 'package:wabi_clone/ui/views/levels/level_page.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class ChipNivel extends StatelessWidget {
  
  final String texto;
  final IconData leading;
  final IconData trailing;

  ChipNivel(
    this.texto,
    this.leading,    
    this.trailing
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LevelPage()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 10),
            Icon(
              leading,
              color: Colors.orange
            ),
            Container(width: 10),
            TextoPersonalizado(texto, 18, Colors.black87, FontWeight.bold, TextAlign.start),
            Container(width: 5),
            Icon(
              trailing,
              color: Colors.black.withOpacity(0.6),
              size: 30,
            )
          ],
        )
      ),
    );
  }
}