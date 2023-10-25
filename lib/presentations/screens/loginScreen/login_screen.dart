import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:  const Text("Login Screen")
    ),
    body: Container(
      decoration: BoxDecoration(
        color: Colors.blue[900],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'iSéneca',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
           TextField(
            decoration: InputDecoration(
              hintText: 'Usuario',
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              )
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide:  const BorderSide(color:Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Entrar'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text('No recuerdo mi contraseña'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Junta de Andalucía Consejería de Educación y Deporte',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            'v11.3.0',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

  }
