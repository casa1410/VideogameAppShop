import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Categoria.dart';
import 'Home.dart';
import 'Informacion.dart';
import 'Login.dart';

class FacturaScreen extends StatefulWidget {
  @override
  _FacturaScreenState createState() => _FacturaScreenState();
}
bool isExpanded = false;
class _FacturaScreenState extends State<FacturaScreen> {
  final TextEditingController _numeroFacturaController = TextEditingController();
  final TextEditingController _nombreClienteController = TextEditingController();
  final TextEditingController _apellidoCLienteController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _direccion = TextEditingController();

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
                      Icons.info,
                      color: Color(0xFF1B2838),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Ayuda',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ayuda()),
                  );
                },
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
      body: Stack(
  children: [
    Positioned(
      child: Container(
        padding: const EdgeInsets.all(16.0), 
        margin: EdgeInsets.only(top: 50, left: 20),
                    constraints: BoxConstraints(
                      maxWidth: 370,
                    ),
                    height: 500,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Factura Electronica',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _numeroFacturaController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Número de Factura',
                      filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.confirmation_number,
                                color: Colors.grey,
                              ),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _apellidoCLienteController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Nombre del Cliente',
                      filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _nombreClienteController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Apellido del Cliente',
                      filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),

                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _direccion,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: 'Direccion Cliete',
                      filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                      
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _totalController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],

                            decoration: InputDecoration(
                              labelText: 'Total valor de Factura',
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.attach_money,
                                color: Colors.grey,
                              ),
                            ),
                    enabled: false,
                  ),
                ],
              ),
            ),
          ),
  ],
),

    );
  }

  void _mostrarSnackbar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
      ),
    );
  }
}

