import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FacturaScreen extends StatefulWidget {
  @override
  _FacturaScreenState createState() => _FacturaScreenState();
}

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
              'Factura',
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
                labelStyle: TextStyle(color: Colors.white),
              ),
              enabled: false,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _apellidoCLienteController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nombre del Cliente',
                labelStyle: TextStyle(color: Colors.white),
              ),
              enabled: false,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nombreClienteController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Apellido del Cliente',
                labelStyle: TextStyle(color: Colors.white),
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
                labelStyle: TextStyle(color: Colors.white),
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
                labelText: 'Total',
                labelStyle: TextStyle(color: Colors.white),
              ),
              enabled: false,
            ),
          ],
        ),
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

