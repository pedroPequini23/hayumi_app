import 'package:flutter/material.dart';
import 'package:hayumi/motor.dart';

class Motor20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaProduto1(),
    );
  }
}

class TelaProduto1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        title: const Center( // Usado pra centralizar o nome no meio da appbar
    child: Text( 'Motor 2.0',
      style: TextStyle(
      color: Color(0xFFFFCC00),
      ),
    ),
  ),
        backgroundColor: Color.fromARGB(255, 0, 36, 84),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFFFCC00),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PagMotor()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'img/logo_splash.jpg', // Caminho da imagem que fica na appbar
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56.0), // Espaço extra acima da imagem
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'img/motor_2_0.jpeg', // Caminho da imagem do produto
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Nome do produto
              Text(
                'Motor 2.0',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8.0),

              // Preço e marca
              Text(
                'R\$ 2.299',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Volkswagen',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16.0),

              // Descrição do produto
              Container(
                padding: EdgeInsets.all(12.0),
                color: Colors.grey[200],
                child: Text(
                  'Motor compatível com Volkswagen Ap',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
