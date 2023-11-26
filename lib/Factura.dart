import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'package:videogameappshop/Ambiente.dart';

class FacturaScreen extends StatefulWidget {
  @override
  _FacturaScreenState createState() => _FacturaScreenState();
}

class _FacturaScreenState extends State<FacturaScreen> {
  final TextEditingController _numeroFacturaController =
      TextEditingController();
  final TextEditingController _nombreClienteController =
      TextEditingController();
  final TextEditingController _apellidoClienteController =
      TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _direccion = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Llamada a la función para obtener datos del usuario
    getUsuarioId();
    // Generar un número de factura aleatorio
    _numeroFacturaController.text = generateRandomInvoiceNumber();
    // Llamada a la función para obtener detalles del videojuego con ID 1 (ajusta según sea necesario)
    getVideojuegoDetails(1);
  }

  // Función para obtener datos del usuario por ID
  Future<void> getUsuarioId() async {
    final url = BASE_URL + "/VGSAPI/getUsuarioId.php?id=1";

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'e1f602bf73cc96f53c10bb7f7953a438fb7b3c0a',
      });

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Usuario: ${data['usuario']}');

        setState(() {
          _nombreClienteController.text = data['usuario']['nombre'];
          _apellidoClienteController.text = data['usuario']['apellido'];
          _direccion.text = data['usuario']['direccion'];
        });
      } else {
        print('Error al obtener datos del usuario: ${response.statusCode}');
      }
    } catch (error) {
      print('Error de red: $error');
    }
  }

  // Genera un número de factura aleatorio de 6 dígitos
  String generateRandomInvoiceNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000; // Números de 6 dígitos
    return randomNumber.toString();
  }

  // Función para obtener detalles del videojuego por ID
  Future<void> getVideojuegoDetails(int idJuego) async {
    final url = BASE_URL + "/VGSAPI/getVideojuegoId.php?id=$idJuego";
    print(idJuego);

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'e1f602bf73cc96f53c10bb7f7953a438fb7b3c0a',
      });

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Videojuego: $data');

        setState(() {
          // Actualiza el controlador del total con el precio del videojuego
          _totalController.text = data['videojuego']['precio'].toString();
        });
      } else {
        print('Error al obtener datos del videojuego: ${response.statusCode}');
      }
    } catch (error) {
      print('Error de red: $error');
    }
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
              // ... Resto del código del Drawer sin cambios
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
                controller: _nombreClienteController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
                controller: _apellidoClienteController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: 'Direccion Cliente',
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
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
    );
  }
}
