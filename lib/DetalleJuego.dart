import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:videogameappshop/Ambiente.dart';
import 'package:videogameappshop/Home.dart';
import 'dart:convert';

import 'package:videogameappshop/Login.dart';

import 'Pago.dart';

class Juego extends StatefulWidget {
  final String idJuego;
  final String imagePath;
  const Juego(this.idJuego, this.imagePath, {Key? key}) : super(key: key);

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  final url = Uri.parse(BASE_URL + "/VGSAPI/getVideojuegoId.php");
  //final gameId = 0;

  late Future<void> futureInformacionJuego = Future.value();

  String nombre = "";
  String precio = "";
  String descripcion = "";
  String categoria = "";
  String genero = "";
  String fecha = "";

  @override
  void initState() {
    super.initState();
    futureInformacionJuego = obtenerInformacionJuego();
  }

  Future<void> obtenerInformacionJuego() async {
    try {
      final response = await http.get(
        Uri.parse('$url?id=${widget.idJuego}'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'authorization': 'e1f602bf73cc96f53c10bb7f7953a438fb7b3c0a',
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(this.widget.idJuego);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Data: $data');
        setState(() {
          nombre = data['videojuego']['nombre'];
          precio = data['videojuego']['precio'].toString();
          print(precio);
          descripcion = data['videojuego']['descripcion'];
          categoria = data['videojuego']['clasificacion_edad'];
          genero = data['videojuego']['genero'];
          fecha = data['videojuego']['fecha_lanzamiento'];
        });
      } else {
        print('Error en la solicitud: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void carrito(String nombres, imagePath, precios) {
    String precios = precio;
    String nombres = nombre;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentScreen(nombres, imagePath, precios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onTap: () {},
              ),
              ListTile(
                title: Column(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ㅤCerrar ㅤㅤSesión',
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
      body: FutureBuilder(
        future: futureInformacionJuego,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Stack(
              children: [
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 24),
                    child: Text(
                      nombre,
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
                          this.widget.imagePath,
                          width: 350,
                          height: 100,
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
                              nombre,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Precio: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '$precio' + "COP",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            carrito(nombre, this.widget.imagePath, precio);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 98, 177, 100),
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 10),
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
                    padding: EdgeInsets.all(15),
                    width: 368,
                    height: 230,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          nombre,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Descripcion: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '$descripcion',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Fecha de Publicacion:: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '$fecha',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Genero: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '$genero',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Clasificacion: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '$categoria',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
