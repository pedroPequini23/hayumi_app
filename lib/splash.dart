import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 36, 84), // Cor de fundo da tela de splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo_splash.jpg', // Caminho da Imagem de fundo que ocupa o espaço definido
              width: 100.0, // Utilizado para usar 100% do tamanho determinado
              height: 100.0, // Define a altura da imagem
            ),
          ],
        ),
      ),
    );
  }
}