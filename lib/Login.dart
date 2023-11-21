import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'Registrar.dart';

class LoginCreate extends StatefulWidget {
  @override
  _LoginCreateState createState() => _LoginCreateState();
}

class _LoginCreateState extends State<LoginCreate> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _showPassword = false;

  Future<void> _iniciarSesion() async {
    final url = Uri.parse('http://localhost/VGSLAPI/loginUsuarios.php');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization': 'e1f602bf73cc96f53c10bb7f7953a438fb7b3c0a',
      },
      body: {
        'email': _emailController.text,
        'contrasena': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String mensaje = responseData['mensaje'];

      if (mensaje == 'Inicio de sesión exitoso') {
        
        print('Inicio de sesión exitoso');
        ir_Home();
      } else {
        
        print('Error al iniciar sesión');
      }
    } else {
      
      print('Error de conexión al servidor');
    }
  }

  void ir_Home() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  void ir_Register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Registrar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Ima2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xFF1B2838),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF1B2838),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20),
                          TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Ingrese Email',
                                filled: true,
                                fillColor: Colors.grey[200],
                                prefixIcon: Icon(
                                  Icons.email, 
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              labelText: 'Ingrese Contraseña',
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showPassword ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              Text(
                                'Recuérdame',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _iniciarSesion();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF5C7EAB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              ir_Register();
                            },
                            child: Text(
                              '¿No tienes cuenta? Crea una.',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
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
          ),
        ),
      ),
    );
  }
}
