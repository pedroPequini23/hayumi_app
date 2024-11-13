import 'package:flutter/material.dart';


class roda1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaProduto1();

  }
}

class TelaProduto1 extends StatefulWidget {
  @override
  _TelaProduto1State createState() => _TelaProduto1State();
}

class _TelaProduto1State extends State<TelaProduto1> {
  final List<Map<String, dynamic>> produtos = [
    {
      "nome": "Jogo de rodas esportivas aro 15",
      "preco": "R\$ 2000",
      "marca": "Sto Rodas",
      "imagens": [
        "img/rodas_aro15_sport.jpg",
        "img/rodas_bmw_aro22.jpg",
        "img/rodas_duster_oroch.jpg",
      ],
      "descricao": "4 rodas esportivas aro 15 da marca STO",
    },
    // Você pode adicionar mais produtos aqui
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final produto = produtos[0]; // Exibindo o primeiro produto para este exemplo

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Rodas',
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
              SizedBox(height: 16.0),
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
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        produto["imagens"][_currentImageIndex],
                        height: 400.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
              SizedBox(height: 16.0),
              // Nome do produto
              Text(
                produto["nome"],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8.0),
              // Preço e marca
              Text(
                produto["preco"],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                produto["marca"],
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
                  produto["descricao"],
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
