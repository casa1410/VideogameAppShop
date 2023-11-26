import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import 'Categoria.dart';
import 'Home.dart';
import 'Login.dart';

class Ayuda extends StatefulWidget {
  @override
  _AyudaState createState() => _AyudaState();
}

class _AyudaState extends State<Ayuda> {
  bool isExpanded = false;

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
                      'Ir a Home',
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
                title: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Color(0xFF1B2838),
                      ),
                      SizedBox(height: 5),
                      Text(
                         'ㅤCerrar ㅤSesión',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cerro sesión exitosamente'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginCreate()),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.bookmarks,
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Categorias',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          'Aventura',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Aventura()),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información de Uso',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '¡Bienvenido a VideoGame Store!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Aquí encontrarás una amplia selección de juegos para todas las plataformas. Para comenzar, sigue explorando la tienda y agrega tus juegos favoritos al carrito de compras.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Información General',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Versión de la Aplicación: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '1.0.0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text: 'Condiciones de Uso: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Lea detenidamente nuestras condiciones de uso antes de realizar cualquier compra. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Descargue el PDF aquí.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch('blob:https://pinetools.com/8e17a1a9-9a18-4def-8535-30d1e3675342');
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text: 'Contacto para reporte de errores: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Cazadiego@videogamestore.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ' Kmendoza@videogamestore.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
