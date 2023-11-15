import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iseneca/provider/provider.dart';
import 'package:iseneca/firebase_options.dart';
import 'package:iseneca/presentations/screens/loginScreen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login",
      home: LoginScreen(),
    );
  }
}
