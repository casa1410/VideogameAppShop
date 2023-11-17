import 'package:flutter/material.dart';

import 'DetalleJuego.dart';

class JuegoInfo {
  final String imagePath;
  final String nombreJuego;
  final String descripcionJuego;
  final String precio;

  JuegoInfo({
    required this.imagePath,
    required this.nombreJuego,
    required this.descripcionJuego,
    required this.precio,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<JuegoInfo> juegos = [
    JuegoInfo(
      imagePath: 'images/Ima1.jpg',
      nombreJuego: 'Super Mario',
      descripcionJuego: 'Recomendado, por que has jugado títulos con etiqueta',
      precio: 'COP 200',
    ),
    JuegoInfo(
      imagePath: 'images/Ima2.jpg',
      nombreJuego: 'Zelda',
      descripcionJuego: 'Recomendado, por que has jugado títulos con etiqueta',
      precio: 'COP 200',
    ),
    JuegoInfo(
      imagePath: 'images/Ima3.jpg',
      nombreJuego: 'Pokemon',
      descripcionJuego: 'Recomendado, por que has jugado títulos con etiqueta',
      precio: 'COP 200',
    ),
  ];

  void juegosdetalle() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Juego()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 95, 126),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 265,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 70,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: juegos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        juegosdetalle();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(juegos[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              juegos[index].nombreJuego,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 3),
                            RichText(
                              text: TextSpan(
                                text: 'Recomendado',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: juegos[index].descripcionJuego.substring(12),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '\$${juegos[index].precio}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 45,
                left: 25,
                child: Text(
                  'DESTACADOS Y RECOMENDADOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 18, top: 5),
                  child: Text(
                  'OFERTAS ESPECIALES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, left: 10),
                  height: 120,
                  //width: 460,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 150, 
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Juego ${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
