import 'package:flutter/material.dart';
import 'package:flutter_app/pages/loginpage.dart';

class registerpage extends StatelessWidget {
  const registerpage({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _header(BuildContext context) {
  return Column(
    children: [
      Text(
        "REGISTRATE",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      Text("ingresa tus datos"),
    ],
  );
}

 _inputField(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "Nombre",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person),
        ),
      ),
      SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "Apellido",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.person),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          hintText: "Correo electrónico",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.email),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          hintText: "Contraseña",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(Icons.lock),
        ),
        obscureText: true,
      ),
      SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
                // Aquí deberías implementar la lógica para enviar un correo electrónico de recuperación de contraseña
                _showVerificationDialog(context);
              },
          child: Text(
            "Registrarse",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
             minimumSize: Size.fromWidth(50),
            backgroundColor: Color.fromARGB(255, 0, 110, 114), // Color azul para el botón
            foregroundColor: Colors.white, // Color del texto  
          ),
        ),
      ),
    ],
  );
}


  
 _login(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // Navegar a otra página cuando se hace clic en el botón "Iniciar sesión"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginpage()), // Reemplaza OtraPagina por la página a la que deseas dirigir al usuario
      );
    },
    child: Text(
      "Iniciar sesión",
      style: TextStyle(fontSize: 20),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF006370), // Color de fondo inicial
      foregroundColor: Colors.white, // Color del texto
      padding: EdgeInsets.symmetric(vertical: 10),
      minimumSize: Size(200, 70), // Tamaño mínimo del botón
    ),
  );
}

  void _showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('NICE'),
          content: Text('TE HAS REGISTRADO CORRECTAMENTE'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ACEPTAR'),
            ),
          ],
        );
      },
    );
  }
}

