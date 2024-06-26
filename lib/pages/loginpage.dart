import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_app/pages/registerpage.dart';
import 'package:flutter_app/pages/restorpage.dart';

import 'package:http/http.dart' as http;


// Clase de configuración para definir la URL base
class AppConfig {
  static const String apiUrl = "http://192.168.50.59/tienda/";
}

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  String mensaje = ''; // Variable para almacenar el mensaje de error
  String username = ''; // Variable para almacenar el nombre de usuario

Future<void> login(BuildContext context) async {
  final response = await http.post(Uri.parse("${AppConfig.apiUrl}login.php"), body: {
    "username": controllerUser.text,
    "password": controllerPass.text,
  });

  var datauser = json.decode(response.body);

  if (datauser.length == 0) {
    setState(() {
      mensaje = "Usuario o contraseña incorrectas";
    });
  } else {
    if (datauser[0]['nivel'] == 'admin' || datauser[0]['nivel'] == 'ventas') {
      setState(() {
        username = datauser[0]['username'];
      });
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 145, 253, 148), Color.fromARGB(255, 234, 244, 252)], // Cambiar los colores según sea necesario
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }



  _header(context) {
    return Column(
      children: [
        Text(
          "INICIAR SESION",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("ingresa tus credenciales"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "usuario",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "contraseña",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),

        SizedBox(height: 20),
        ElevatedButton(
         onPressed: () {
            login(context);
          },
          child: Text(
            "Iniciar",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 45, 97), // Color de fondo inicial
            foregroundColor: Colors.white, // Color del texto
            padding: EdgeInsets.symmetric(vertical: 10),
            minimumSize: Size(100, 50),  // Tamaño mínimo del botón
          ),
          // Cambiar el color de fondo cuando se presione el botón
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
          // Navegar a otra página cuando se hace clic en el botón "registrate"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => restorpage()), // Reemplaza RegistroPage por la página a la que deseas dirigir al usuario
          );
        },
         child: Text("olvidaste tu contraseña?"));
  }

_signup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("¿Aún no tienes cuenta? "),
      TextButton(
        onPressed: () {
          // Navegar a otra página cuando se hace clic en el botón "registrate"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => registerpage()), // Reemplaza RegistroPage por la página a la que deseas dirigir al usuario
          );
        },
          child: Text("Regístrate"),
        )
      ],
    );
  }
}
