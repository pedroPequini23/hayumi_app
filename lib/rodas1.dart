import 'package:flutter/material.dart';


class Roda1 extends StatelessWidget {
  const Roda1({super.key});

  @override
  Widget build(BuildContext context) {
    return const TelaProduto1();

  }
}

class TelaProduto1 extends StatefulWidget { // define o widget como StatefulWidget, permitindo alterações dinâmicas (como a troca de imagens).
  const TelaProduto1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaProduto1State createState() => _TelaProduto1State(); 
}

class _TelaProduto1State extends State<TelaProduto1> { //classe criada para passar as informações do produto
  final List<Map<String, dynamic>> produtos = [ //lista que passa as informacçoes do produto atraves de variáveis que são cada info do produto(nome, preço, marca...)
    {
      "nome": "Jogo de rodas de marca bmw (NOVO)",
      "preco": "R\$ 7500",
      "marca": "BMW",
      "imagens": [
        "img/roda_bmw_outro_angulo.jpg",
        "img/rodas_bmw_aro22.jpg",
      ],
      "descricao": "4 rodas esportivas de marca BMW",
    },
  ];

  int _currentImageIndex = 0; //indice que indica qual imagem está sendo exibida

  @override
  Widget build(BuildContext context) {
    final produto = produtos[0];

    return Scaffold(  // estrutura principal da tela com appbar e body.
      backgroundColor: const Color.fromARGB(255, 214, 239, 255), //cor de fundo da tela
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Jogo de rodas de marca bmw', //titulo com o nome do produto localizado no meio da appbar
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
            Navigator.pop(context); //botão com seta de back para voltar para a tela de categoria, o "pop" serve para não dar looping na navegação
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'img/logo_splash.jpg', //imaggem que fica na appbar
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( //permite deixar a tela rolável, assim sendo ideal para adicionar informações a mais
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column( //estrutura que organiza as informações da tela (imagem, botao de passar para a proxima tela, descrição, valor e fabricante)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Stack( //stack para exibir a imagem atual do produto
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
                        produto["imagens"][_currentImageIndex], //alteram entre as imagens disponiveis, alterando seu índice no _currentImageIndex
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
                  produto["descricao"], //espaço para a descrição do protudo em um container com cor de fundo cinza claro
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
