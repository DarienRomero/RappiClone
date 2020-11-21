import 'package:flutter/material.dart';
import 'package:wabi_clone/ui/widgets/button_back.dart';
import 'package:wabi_clone/ui/widgets/chip_nivel.dart';
import 'package:wabi_clone/ui/widgets/texto_personalizado.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  String _nombre;
  String _apellido;
  String _numeroIdentidad;
  String _email;
  String _celular;
  DateTime _fechaNacimiento;
  String _fechaNacimientoStr = "";
  String _sexo = "Hombre";

  bool ocurrioCambio = false;
  List<String> meses = ["Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];

  TextEditingController _nombreController = TextEditingController();

  final GlobalKey<FormFieldState> _keyNombre = GlobalKey<FormFieldState>();

  FocusNode focusNombre = FocusNode();

  @override
  void initState() {
    focusNombre.addListener(verificadorFocusNombre);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _nombre = "Darien Romero";
      _nombreController.text = _nombre;
      //focusNombre.requestFocus();
    });
  }

  @override
  void dispose() { 
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ocurrioCambio ? FloatingActionButton.extended(
        label: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Center(
            child: TextoPersonalizado("Guardar", 18, Colors.white, FontWeight.bold, TextAlign.center)
          )
        ),
        onPressed: (){},
      ) : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        margin: EdgeInsets.only(
          top: 5,
          right: 5,
          left: 5,
          bottom: 80
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonBack(context),
              TextoPersonalizado("Mi perfil", 18, Colors.black, FontWeight.bold, TextAlign.start),
              TextoPersonalizado("Actualiza tus datos personales", 18, Colors.black54, FontWeight.normal, TextAlign.start),
              Container(height: 5),
              ChipNivel("Bronce", Icons.assignment_ind, Icons.keyboard_arrow_right),
              Container(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextoPersonalizado("Nombres", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoNombre(),
                    TextoPersonalizado("Apellidos", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoApellidos(),
                    TextoPersonalizado("Número de identidad", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoNumeroIdentidad(),
                    TextoPersonalizado("E-mail", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoEmail(),
                    TextoPersonalizado("Celular", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoCelular(),
                    TextoPersonalizado("Fecha de nacimiento", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    campoFechaNacimiento(context),
                    TextoPersonalizado("Sexo", 18, Colors.black54, FontWeight.bold, TextAlign.start),
                    crearSexo()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  void verificadorFocusNombre() {
    if (!focusNombre.hasFocus) {
      if(_nombre.isEmpty){
        _keyNombre.currentState.validate(); 
      }    
    }else{
      _nombre = _nombreController.text;
      _keyNombre.currentState.reset();
      _nombreController.text = _nombre;
    }
  }

  Widget campoNombre(){
    return Container(
      child: TextFormField(
        key: _keyNombre,
        focusNode: focusNombre,
        controller: _nombreController,
        validator: (input){
          //validarCampo(input);
        },
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
          if(!ocurrioCambio){
            setState(() {
              ocurrioCambio = true;
            });
          }
          _nombre = input;
        },
      ),
    );
  }
  Widget campoApellidos(){
    return Container(
      child: TextFormField(
        validator: (input) => input.isEmpty ? "Escriba un apellido": null,
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
          _apellido = input;
        },
      ),
    );
  }
  Widget campoNumeroIdentidad(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (input) => input.isEmpty ? "Escriba un número de identidad": null,
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
  Widget campoEmail(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (input) => input.isEmpty ? "Escriba un número de identidad": null,
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
  Widget campoCelular(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (input) => input.isEmpty ? "Escriba un número de identidad": null,
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
  Widget campoFechaNacimiento(BuildContext context){
    return GestureDetector(
      onTap: (){
        seleccionarFecha(context);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 50,
        child : Text(
          _fechaNacimientoStr,
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
      setState(() {
        _fechaNacimientoStr = picked.day.toString() + "/" + picked.month.toString() + "/" + picked.year.toString(); 
      });
    }
  }
  Widget crearSexo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            setState(() {
              _sexo = "Hombre";
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color:  _sexo == "Hombre" ? Colors.black : Colors.white
            ),
            child: Center(child: TextoPersonalizado("Hombre", 18, _sexo == "Hombre" ? Colors.white : Colors.black, FontWeight.bold, TextAlign.center)),
          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              _sexo = "Mujer";
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: _sexo == "Mujer" ? Colors.black : Colors.white
            ),
            child: Center(child: TextoPersonalizado("Mujer", 18, _sexo == "Mujer" ? Colors.white : Colors.black, FontWeight.bold, TextAlign.center)),
          ),
        )
      ],
    );
  }
}