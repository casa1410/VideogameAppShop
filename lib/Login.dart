import 'dart:ui';

import 'package:flutter/material.dart';

class LoginCreate extends StatefulWidget {
  @override
  _LoginCreateState createState() => _LoginCreateState();
}

class _LoginCreateState extends State<LoginCreate> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://th.bing.com/th/id/R.646868beeb88c58dde8f6d6d33ae8290?rik=k2hnP8p44Khefg&riu=http%3a%2f%2fwww.tudoparatudo.com%2fwp-content%2fuploads%2f2017%2f06%2fvideogame.jpg&ehk=ZY3%2b%2b2jaSHdAw97281wTaVNptfAYSZAf7%2fJkuSu%2ffVQ%3d&risl=&pid=ImgRaw&r=0',
            ),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      //color: Colors.white.withOpacity(0.7),
                      color: Color(0xFF1B2838),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          //color: Colors.black.withOpacity(0.8),
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
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Ingrese Nombre/Usuario',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Ingrese Contraseña',
                              filled: true,
                              fillColor: Colors.grey[200],
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF5C7EAB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
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
