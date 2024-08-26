import 'package:flutter/material.dart';
import 'package:projeto_final/views/cadastro/cadastro.dart';
import 'package:projeto_final/views/cadastro/login.dart';
import 'package:projeto_final/views/principal.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Projeto Final',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/principal': (context) => const Principal(),
      },
    );
  }
}
