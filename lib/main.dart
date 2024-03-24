import 'package:flutter/material.dart';
import 'package:flutter_app/pages/loginpage.dart';
import 'package:flutter_app/pages/registerpage.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.green,
              Color.fromARGB(255, 253, 253, 253)
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bienvenido a nuestra aplicación',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Aquí puedes encontrar una breve explicación sobre la historia de las aplicaciones:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Las aplicaciones móviles han revolucionado la forma en que interactuamos con la tecnología. A lo largo de los años, han pasado por varias etapas de desarrollo y han evolucionado desde simples aplicaciones hasta potentes herramientas que forman parte integral de nuestras vidas diarias. Desde el lanzamiento del primer iPhone en 2007, el mundo de las aplicaciones ha experimentado un crecimiento explosivo, con millones de aplicaciones disponibles en las tiendas de aplicaciones de hoy en día, abarcando una amplia gama de categorías y funciones.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                onPressed: () {
                    // Navegar a otra página cuando se hace clic en el botón "registrate"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              registerpage()), // Reemplaza RegistroPage por la página a la que deseas dirigir al usuario
                    );
                  },
                  child: Text('Registrarse'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navegar a otra página cuando se hace clic en el botón "registrate"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              loginpage()), // Reemplaza RegistroPage por la página a la que deseas dirigir al usuario
                    );
                  },
                  child: Text('Iniciar Sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: homepage(),
  ));
}
