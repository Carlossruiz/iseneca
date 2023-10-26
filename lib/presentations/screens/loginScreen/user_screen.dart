import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Flutter Wrap Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Wrap Example'),
        ),
        body: Center(
          child: Wrap(
            spacing: 8.0, // gap between adjacent tiles
            runSpacing: 4.0, // gap between lines
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning),
                    Text('Avisos'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline),
                    Text('Bandeja de firmas'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline),
                    Text('Información del centro'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline),
                    Text('Personal del centro'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_none),
                    Text('Tablón de anuncios'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today_outlined),
                    Text('Calendario escolar'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined),
                    Text('Inicio'),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child:
                    const Column(mainAxisAlignment: MainAxisAlignment.center, children:
                        [Icon(Icons.chat_outlined), Text('Comunicaciones')]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  
