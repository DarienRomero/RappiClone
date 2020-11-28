import 'package:flutter/material.dart';
/* class CodigoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: (){}),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black), onPressed: (){})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gana S/12', style: TextStyle(
                    color: Colors.black87,  
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Steady',
                  ),),
              SizedBox(height: 12.0,),
              Text('Recibe S/12 por cada amigo que haga su primer pedidocon tu codigo y regalales hasta S/20 de descuento en su primer pedido', style: TextStyle(
                    color: Colors.black87,  
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                    height: 1.3
                  ),),
              SizedBox(height: 36 ,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TU CÓDIGO', style: TextStyle(
                    color: Colors.grey[600],  
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 5 ,),
                        Text('darienr711', style: TextStyle(
                    color: Colors.black87,  
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),),
                      ],
                    ),
                    Text('Copiar', style: TextStyle(
                    color: Color.fromRGBO(23, 184, 106, 1),  
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 1.4
                  ),)
                  ],
                ),
              ),

              SizedBox(height: 40,),
              Column(
                children: [
                  Text('Comparte tu codigo y gana', style: TextStyle(
                    color: Colors.grey[800],  
                    fontSize: 20.0
                  ),),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/img/wsp_icon.svg', color: Colors.white,),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 212, 105, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/img/facebook_icon.svg', color: Colors.white,),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(24, 120, 241, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/img/instagram_icon.svg', color: Colors.white,),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(169, 25, 176, 1),
                              Color.fromRGBO(246, 30, 121, 1),
                              Color.fromRGBO(251, 220, 5, 1),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft
                            ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: (){},
                          child: Icon(Icons.more_horiz)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          label: 'Mi codigo',
          icon: Icon(Icons.chrome_reader_mode)
          ),
        BottomNavigationBarItem(
          label: 'Contactos',
          icon: Icon(Icons.supervised_user_circle)
          ),
        BottomNavigationBarItem(
          label: 'Contactos',
          icon: Icon(Icons.sync)
          ),
      ]),
    );
  }
} */