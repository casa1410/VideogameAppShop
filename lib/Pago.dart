import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videogameappshop/Home.dart';
import 'package:videogameappshop/Login.dart';

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

class PaymentScreen extends StatefulWidget {
  final String nombres, imagePath, precios;

  PaymentScreen(this.nombres, this.imagePath, this.precios, {Key? key})
      : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _currentIndex = 0;

  late List<JuegoInfo> juegos;

  @override
  void initState() {
    super.initState();

    juegos = [
      JuegoInfo(
        imagePath: this.widget.imagePath,
        nombreJuego: this.widget.nombres,
        descripcionJuego: 'Estado       Reservado',
        precio: this.widget.precios,
      ),
    ];
  }



  final String gameName = "Nombre del juego";
  final double price = 19.99;
  final TextEditingController _visa = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();



  

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
          Container(
            margin: EdgeInsets.only(left: 16, top: 45),
            height: 265,
            width: 380,
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
           child: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: juegos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
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
                      height: 170,
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                    RichText(
                      text: TextSpan(
                        text: 'Estado',
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
                      '\$${juegos[index].precio} ' + 'COP',
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
          ),

          Container(
            margin: EdgeInsets.only(left: 16, top: 20),
            child: Text(
              'CARRITO DE COMPRAS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
           Container(
            margin: EdgeInsets.only(left: 16, top: 335),
            child: Text(
              'FORMATO DE PAGO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 360),
            height: 300,
            width: 380,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: _visa,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: 'Ingrese Numero Tarjeta',
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expiryDate,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Fecha',
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _cvv,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Pago realizado con éxito'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 98, 177, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20),
                    ),
                    child: Text(
                      'Realizar Pago',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



