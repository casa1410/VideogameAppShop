import 'dart:async';

import 'package:flutter/material.dart';

import 'DetalleJuego.dart';
import 'Login.dart';

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


  
   int _imagenIndex = 0;
  List<String> _imagePaths = [
    'assets/images/Ima1.jpg',
    'assets/images/Ima2.jpg',
    'assets/images/Ima3.jpg',
  ];

  @override
  void initState() {
    super.initState();

    // Inicia un temporizador que cambia la imagen cada 3 segundos.
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        setState(() {
          _imagenIndex = (_imagenIndex + 1) % _imagePaths.length;
        });
      }
    });
  }



  int _currentIndex = 0;
  List<JuegoInfo> juegos = [
    JuegoInfo(
      imagePath: 'assets/images/Ima1.jpg',
      nombreJuego: 'Super Mario',
      descripcionJuego: 'Recomendado, por que has jugado títulos con etiqueta',
      precio: 'COP 200',
    ),
    JuegoInfo(
      imagePath: 'assets/images/Ima2.jpg',
      nombreJuego: 'Zelda',
      descripcionJuego: 'Recomendado, por que has jugado títulos con etiqueta',
      precio: 'COP 200',
    ),
    JuegoInfo(
      imagePath: 'assets/images/Ima3.jpg',
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
                      Icons.person_pin, 
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5), 
                    Text(
                      'ㅤ CerrarㅤSesión',
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
        alignment: Alignment.topRight,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 265,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 40,
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
                                    text: juegos[index]
                                        .descripcionJuego
                                        .substring(12),
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
                top: 18,
                left: 18,
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
                  margin: EdgeInsets.only(left: 18, top: 330),
                  child: Text(
                    'OFERTAS ESPECIALES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                margin: EdgeInsets.only(top: 6, left: 10, right: 6),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    List<String> imagePaths = [
                      'assets/images/Ima1.jpg',
                      'assets/images/Ima2.jpg',  
                      'assets/images/Ima3.jpg',  
                    ];
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Juego()));
                            break;
                          case 1:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Juego()));
                            break;
                          case 2:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Juego()));
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 150,
                        child: Image.asset(
                          imagePaths[index],
                          width: 150, 
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              ],
            ),
          ),
           Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 18, top: 500),
                  child: Text(
                    'NOTICIAS DE LA SEMANA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              _imagePaths[_imagenIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '¡Noticias Importantes!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '1. Nueva actualización para "VIDEOGAME STORE": ¡Más niveles y desafíos!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '2. Emocionantes descuentos por el Black Friday!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
