import 'package:flutter/material.dart'; //importação das telas para realizar as naveçações en pacotes do flutter
import 'package:hayumi/freios.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/rodas1.dart';
import 'package:hayumi/rodas2.dart';
import 'package:hayumi/rodas3.dart';
import 'package:hayumi/rodas4.dart';
import 'package:hayumi/rodas5.dart';
import 'package:hayumi/todos.dart';

class PagRodas extends StatefulWidget { // widget do tipo StatefulWidget para gerenciar as abas e as navegções
  const PagRodas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagRodasState createState() => _PagRodasState();
}

class _PagRodasState extends State<PagRodas> with SingleTickerProviderStateMixin { // classe de estado que gerencia a lógica de interação da tela
  late TabController _tabController; //controla as abas da interface

  @override
  void initState() { // inicia o controlador das 5 abas
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Função para navegar entre as telas 
  void _navegacaoentretelas(int index) {
    if (index == 1) return; // Evita recarregar a pag que ta selecianada 
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TelaTodos()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagRodas()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagPneus()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagMotor()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagFreios()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) { // utilizado para construir a interface da tela
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 239, 255), //cor de fundo da tela
      appBar: AppBar( //cabeçalho da tela
        title: const Text('Rodas',style: TextStyle( // titulo que fica na appbar
            color: Color(0xFFFFCC00), // cor do titulo
          ),),
          backgroundColor: const Color.fromARGB(255, 0, 36, 84), // cor do fundo da appbar
          elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // seta de voltar que redireciona para a Telatodos
            color: Color(0xFFFFCC00),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaTodos()),
            );
          },
        ),
        actions: [
          Image.asset(
            'img/logo_splash.jpg', // caminho da imagem que fica na appbar
            width: 40.0,
            height: 40.0,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar( //widget para exibir as abas
            controller: _tabController,
            isScrollable: false, 
            labelColor: const Color.fromARGB(255, 255, 204, 0),
            unselectedLabelColor: const Color.fromARGB(255, 255, 204, 0),
            indicator: const BoxDecoration(), // Remove o marcador de aba selecionada
            onTap: (index) { 
              _navegacaoentretelas(index); // Chama a função de navegação para gerenciar a navegação entre as telas
            },
            tabs: const [
              Tab(text: 'Todos'),
              Tab(text: 'Rodas'),
              Tab(text: 'Pneus'),
              Tab(text: 'Motor'),
              Tab(text: 'Freios'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Define 2 colunas de img em "grade", onde cada item é um widget com o nome de ImageButton com imagem e texto que navega para a tela do produto especifico
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            ImageButton( //botão com imagem e texto, utilizando o widget imagebutton
              imagePath: 'img/rodas_aro15_sport.jpg', // caminho da imagem que é exibida no botão
              label: 'Rodas esportivas STO', // texto exibido embaixo da imagem do botão
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84), // estilo do texto do botao (no caso a fonte e a cor)
              fontWeight: FontWeight.bold),
              onPressed: () { //função executado ao clicar nele
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Roda2()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/rodas_bmw_aro22.jpg',
              label: 'Jogo de rodas BMW aro 22',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Roda1()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/4_rodas_creta_i30_veloster.jpg',
              label: 'Jogo de rodas para Hyundai e Chevrolet',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Roda5()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/rodas_duster_oroch.jpg',
              label: 'Rodas para Renault duster e oroch',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Roda3()),
                );
              },
            ),
            // Botão com imagem
            ImageButton(
              imagePath: 'img/rodas_onix_prisma.jpg',
              label: 'Rodas para Chevrolet onix e prisma',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Roda4()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizável para os botões com imagem e texto
class ImageButton extends StatelessWidget {
  final String imagePath; //caminho da imagem a ser utilizada
  final String label; // texto que é exibido embaixo da imagem
  final VoidCallback onPressed; // navegação que é executada ao clicar no botão
  final TextStyle? labelStyle; // parâmetro para mudar cor ou estilo do texto

  const ImageButton({ //construtor do imagebutton
    super.key,
    required this.imagePath, //caminho da imagem a ser utilizada
    required this.label, // texto que é exibido embaixo da imagem
    required this.onPressed, // navegação que é executada ao clicar no botão
    this.labelStyle, // parâmetro para mudar cor ou estilo do texto
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // cor de fundo do botão
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Define o formato do botão
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // A imagem vai cobrir o espaço disponível no botão
            ),
          ),
          const SizedBox(height: 8.0), // espaçamento pequeno antes do texto
          Text(
            label,
            style: labelStyle, // estilo utilizado para trocar a cor da fonte
          ),
        ],
      ),
    );
  }
}