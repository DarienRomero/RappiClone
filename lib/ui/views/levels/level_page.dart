import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:wabi_clone/core/models/niveles.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class LevelPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Niveles(), 
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Cabecera()
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoPersonalizado("Niveles", 22, Colors.black, FontWeight.bold, TextAlign.start),
                  TextoPersonalizado("MIRA LO QUE PUEDES\nOBTENER CUANDO", 16, Colors.black54, FontWeight.bold, TextAlign.start),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardNivel([Colors.orange[400], Colors.yellow[700]]),
                    CardNivel([Colors.purple[300], Colors.purple[400]]),
                    CardNivel([Colors.purple[300], Colors.purple[400]]),
                    CardNivel([Colors.purple[300], Colors.purple[400]]),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class CardNivel extends StatelessWidget {
  
  final List<Color> colores;

  CardNivel(
    this.colores,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          colors: colores
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextoPersonalizado("Bronce", 22, Colors.white, FontWeight.bold, TextAlign.start),
          TextoPersonalizado("El nivel básico", 18, Colors.white, FontWeight.bold, TextAlign.start),
        ],
      ) 
    );
  }
}
class Cabecera extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int puntaje = Provider.of<Niveles>(context).puntaje;
    String nivelStr = Provider.of<Niveles>(context).nivelStr;
    return Column(
      children: [
        Stack(
          children: [
            Center(child: TextoPersonalizado(nivelStr, 30, Colors.black, FontWeight.bold, TextAlign.center)),
            Row(
              children: [
                Expanded(child: Container()),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.info_outline),
                ),
              ],
            )
          ],
        ),
        Container(height: 20),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CircularPercentIndicator(
                radius: 180.0,
                lineWidth: 10.0,
                percent: puntaje * 1.0 / 700.0,
                reverse: true,
                center: Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextoPersonalizado(puntaje.toString(), 36, Colors.black, FontWeight.bold, TextAlign.center),
                      TextoPersonalizado("de 700", 22, Colors.black87, FontWeight.bold, TextAlign.center),
                    ],
                  ),
                ),
                backgroundColor: Colors.grey[200],
                progressColor: Colors.orange
              ),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/nivel_bronce.png")
                  )
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}