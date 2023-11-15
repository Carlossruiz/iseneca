import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:iseneca/presentations/screens/loginScreen/user_screen.dart';
import 'package:iseneca/provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Agregar líneas de depuración
      print("Usuario de Google: ${googleUser.displayName}");
      print("Autenticación con Google exitosa.");

      // Después de iniciar sesión con Google, navegar a la pantalla de usuario
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserScreen(userName: googleUser.displayName ?? "")),
      );
    } catch (e) {
      // Agregar línea de depuración
      print("Error al iniciar sesión con Google: $e");
    }
  }

  void _loginWithCredentials(BuildContext context) {
    // Obtener el UserProvider desde el contexto
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    // Obtener el usuario y la contraseña ingresados
    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    // Verificar si el usuario y la contraseña coinciden con la lista
    bool isUserValid = userProvider.userList.any((user) =>
        user.username == enteredUsername && user.password == enteredPassword);

    if (isUserValid) {
      // Si el usuario es válido, navegar a la pantalla de usuario
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserScreen(userName: enteredUsername)),
      );
    } else {
      // Si el usuario no es válido, mostrar un mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error de inicio de sesión'),
          content: Text('Usuario o contraseña incorrectos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: GestureDetector(
        onTap: () {
          // Ocultar el teclado al tocar fuera de los campos de texto
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
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
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
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
                onPressed: () {
                  // Ocultar el teclado antes de realizar el inicio de sesión con usuario y contraseña
                  FocusManager.instance.primaryFocus?.unfocus();
                  _loginWithCredentials(context);
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _signInWithGoogle(context),
                child: const Text('Iniciar sesión con Google'),
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
      ),
    );
  }
}
