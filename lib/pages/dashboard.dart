import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Navegar a la página de inicio de sesión cuando se hace clic en el botón "Cerrar Sesión"
              Navigator.pushReplacementNamed(context,
                  'loginpage.dart'); // Reemplaza '/login' con la ruta de tu página de inicio de sesión
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text('IMAGENES'),
                  value: 'accion1',
                ),
                PopupMenuItem(
                  child: Text('CONFIGURACION'),
                  value: 'accion2',
                ),
                PopupMenuItem(
                  child: Text('PERFIL'),
                  value: 'accion3',
                ),
              ];
            },
            onSelected: (value) {
              // Aquí puedes agregar la lógica para manejar las acciones
              print('Se seleccionó la acción: $value');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dashboard,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              '¡Bienvenido al Dashboard!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.yellow,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.thumb_up,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
