import 'package:flutter/material.dart';
import 'package:videogameappshop/Home.dart';

import 'Login.dart';

class Juego extends StatefulWidget {
  const Juego({super.key});

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF1B2838),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B2838),
        elevation: 0,
              title: Padding(
              padding: EdgeInsets.only(left: 6), 
              child: Text(
                "VIDEOGAME STORE",
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
     drawer: Drawer(
        width: 105,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 5, 
                color: Color(0xFF1B2838), 
              ),
              SizedBox(
                height: 100, 
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF1B2838), 
                  ),
                  child: Text(
                    'Opciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
               ListTile(
                title: Column(
                  children: [
                    Icon(
                      Icons.home, 
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5), 
                    Text(
                      'Ir al Inicio',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              ListTile(
                title: Column(
                  children: [
                    Icon(
                      Icons.shopping_cart, 
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5), 
                    Text(
                      'Carrito de Compras',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {
                },
              ),
              ListTile(
                title: Column(
                  children: [
                    Icon(
                      Icons.exit_to_app , 
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5), 
                    Text(
                      'ㅤCerrar ㅤSesión',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginCreate()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
       children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 24),
            child: Text(
              'Nombre del juego',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
            Positioned(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20),
          constraints: BoxConstraints(
            maxWidth: 370,
          ),
          padding: EdgeInsets.all(8),
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.black.withOpacity(0.3),
                Colors.white.withOpacity(0.2),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                'assets/images/Ima2.jpg',
                width: 370, 
                height: 220, 
                fit: BoxFit.cover,
              ),
              SizedBox(width: 2), 
              Image.asset(
                'assets/images/Ima3.jpg',
                width: 370, 
                height: 220, 
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 290, left: 20),
            constraints: BoxConstraints(
              maxWidth: 365,
            ),
            padding: EdgeInsets.all(8),
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.green.withOpacity(0.3),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre del juego',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Precio: \$200,000 COP', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 98, 177, 100),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Comprar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
        Positioned(
        child: Container(
          margin: EdgeInsets.only(top: 400, left: 20),
          padding: EdgeInsets.all(10),
          width: 368,
          height: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.green.withOpacity(0.3),
                ],
              ),
            ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre del juego',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Descripción del juego: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus scelerisque mauris et velit imperdiet, nec tempus quam congue.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Jugabilidad: Alta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Personajes: 5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              // Agrega más información según sea necesario
            ],
          ),
        ),
      ),


       ],
      ),
    );
  }
}