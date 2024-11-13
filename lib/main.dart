import 'package:flutter/material.dart';
import 'package:hayumi/login.dart';



void main() {
  runApp(const MainApp()); // Executa o MainApp que inclui o MaterialApp
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: SplashScreen(), // Define a tela de splash como a tela inicial
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(), // Define a tela de splash como a tela inicial
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simula um atraso para a tela de splash
    Future.delayed(const Duration(seconds: 13), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), // Navega para a telatodos
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 36, 84), // Cor de fundo da tela de splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'img/logo_splash.jpg', // Caminho da Imagem de fundo onde vai ocupar o espaço definido
              fit: BoxFit.cover, // Expande a imagem por todo espaço definido
              width: 400, // Define a largura da imagem
              height: 600.0 // Define a altura da imagem
            ),
          ],
        ),
      ),
    );
  }
}