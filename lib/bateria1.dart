import 'package:flutter/material.dart';


class Bateria1 extends StatelessWidget {
  const Bateria1({super.key});

  @override
  Widget build(BuildContext context) {
    return const TelaProduto1();

  }
}

class TelaProduto1 extends StatefulWidget {
  const TelaProduto1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaProduto1State createState() => _TelaProduto1State();
}

class _TelaProduto1State extends State<TelaProduto1> {
  final List<Map<String, dynamic>> produtos = [
    {
      "nome": "Bateria de carro Corsa 60ah (NOVO)",
      "preco": "R\$ 500",
      "marca": "Moura",
      "imagens": [
        "img/bateria_moura.jpg",
      ],
      "descricao": "Bateria compacta para veículos pequenos, com capacidade de 60Ah e tensão de 12V.",
    },
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final produto = produtos[0];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Bateria de carro Corsa 60ah',
            style: TextStyle(
              color: Color(0xFFFFCC00),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 36, 84),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFCC00),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'img/logo_splash.jpg',
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
              const SizedBox(height: 16.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        produto["imagens"][_currentImageIndex],
                        height: 400.0,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      onPressed: _currentImageIndex > 0
                          ? () {
                              setState(() {
                                _currentImageIndex--;
                              });
                            }
                          : null,
                    ),
                  ),
                  Positioned(
                    right: 8.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      onPressed: _currentImageIndex < produto["imagens"].length - 1
                          ? () {
                              setState(() {
                                _currentImageIndex++;
                              });
                            }
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // Nome do produto
              Text(
                produto["nome"],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 8.0),
              // Preço e marca
              Text(
                produto["preco"],
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                produto["marca"],
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16.0),
              // Descrição do produto
              Container(
                padding: const EdgeInsets.all(12.0),
                color: Colors.grey[200],
                child: Text(
                  produto["descricao"],
                  style: const TextStyle(
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
