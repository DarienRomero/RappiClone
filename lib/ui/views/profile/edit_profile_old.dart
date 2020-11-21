import 'package:flutter/material.dart';
import 'package:wabi_clone/ui/widgets/chip_nivel.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class EditProfileOld extends StatefulWidget {
  
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileOld> {
  
  String   _nombre;
  String   _apellidos;
  String   _numeroIdentidad;
  String   _email;
  String   _celular;
  DateTime _fechaNacimiento;
  String   _fecha = "";
  String   _sexo;

  bool visible = false;

  List<String> meses = ["Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];

  TextEditingController _nombreController = new TextEditingController();

  @override
  void dispose() { 
    _nombreController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _nombre = "Darien Romero";
      _nombreController.text = _nombre;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.greenAccent
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextoPersonalizado("Mi perfil", 18, Colors.black, FontWeight.bold, TextAlign.start),
                      TextoPersonalizado("Actualiza tus datos personales.", 20, Colors.black, FontWeight.normal, TextAlign.start),
                      ChipNivel("Bronce", Icons.assignment_ind, Icons.keyboard_arrow_right),
                    ]
                  ),
                )
              ]
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextoPersonalizado("Nombres", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                  Container(height: 10),
                  crearNombre(),
                  TextoPersonalizado("Apellidos", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                  Container(height: 10),
                  crearApellidos(),
                  TextoPersonalizado("Número de identidad", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                  Container(height: 10),
                  crearNumeroIdentidad(),
                  TextoPersonalizado("E-mail", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                  Container(height: 10),
                  crearEMail(),
                  // TextoPersonalizado("Celular", 16, Colors.black, FontWeight.normal, TextAlign.start),
                  // crearCelular(context),
                  TextoPersonalizado("Fecha de nacimiento", 16, Colors.black, FontWeight.normal, TextAlign.start),
                  crearFechaNacimiento(context),
                  /*TextoPersonalizado("Sexo", 16, Colors.black, FontWeight.normal, TextAlign.start),
                  crearSexo() */
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: visible ? FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Color(0xff04f94f),
        label: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: TextoPersonalizado("Guardar", 18, Colors.white, FontWeight.bold, TextAlign.center)
          )
        )
      ) : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget crearNombre(){
    return Container(
      child: TextFormField(
        controller: _nombreController,
        style: TextStyle(
          fontSize: 20
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ), 
        ),
        onChanged: (input){
          if(!visible){
            setState(() {
              visible = true;
            });
          }
          _nombre = input;
        },
      ),
    );
  }

  Widget crearApellidos(){
    return Container(
      child: TextFormField(
        style: TextStyle(
          fontSize: 20
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ), 
        ),
        onChanged: (input){
          _apellidos = input;
        },
      ),
    );
  }

  Widget crearNumeroIdentidad(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 20
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ), 
        ),
        onChanged: (input){
          _numeroIdentidad = input;
        },
      ),
    );
  }

  Widget crearEMail(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 20
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 0.5
            ),
          ), 
        ),
        onChanged: (input){
          _email = input;
        },
      ),
    );
  }

  Widget crearCelular(BuildContext context){
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (input){
              _celular = input;
            },
          ),
        ),
      ],
    );
  }

  Widget crearFechaNacimiento(BuildContext context){
    return GestureDetector(
      onTap: (){
        seleccionarFecha(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 10, top: 15),
        height: 50,
        child : Text(
          _fecha,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black12,
            width: 0.5
          )
        ),
      ),
    );
  }

  void seleccionarFecha(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960, 8),
      lastDate: DateTime(2100)
    );
    if (picked != null){
      _fechaNacimiento = picked;
      _fecha = picked.day.toString() + " de " + meses[picked.month - 1] + " del " + picked.year.toString(); 
    }
  }

  Widget crearSexo(){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
          ),
          child: TextoPersonalizado("Hombre", 16, Colors.black87, FontWeight.bold, TextAlign.center),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )
          ),
          child: TextoPersonalizado("Mujer", 16, Colors.black87, FontWeight.bold, TextAlign.center),
        ),
      ],
    );
  }
}