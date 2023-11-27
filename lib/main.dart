import 'package:flutter/material.dart';
import 'AguardarMecanico.dart';
import 'SolicitarMecanico.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Definindo a página inicial como LoginPage
    );
  }
}



// Adicione suas outras páginas aqui, como AguardarMecanico e SolicitarMecanico
