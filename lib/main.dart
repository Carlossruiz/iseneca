import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text('Chia Díaz, ISeréneca'),
            ]
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            // Información del usuario con fondo azul
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Título',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Centro: I.E.S. Llanes'),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cargo: ISeréneca'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  // Avisos y Bandeja de firmas en un Row con fondo azul
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: _buildMenuItem('Avisos', Icons.notifications),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: _buildMenuItem('Bandeja de firmas', Icons.inbox),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Espacio entre el cuadro superior y los botones
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: <Widget>[
                  _buildMenuItem('Información del centro', Icons.info),
                  _buildMenuItem('Tablón de anuncios', Icons.announcement),
                  _buildMenuItem('Calendario escolar', Icons.calendar_today),
                  _buildMenuItem('Menú', Icons.restaurant_menu),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData iconData) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, size: 36.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
