import 'package:flutter/material.dart';
import 'package:hayumi/bateria.dart';
import 'package:hayumi/escape.dart';
import 'package:hayumi/filtroar.dart';
import 'package:hayumi/freios.dart';
import 'package:hayumi/lamp.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/oleos.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/radiador.dart';
import 'package:hayumi/retro.dart';
import 'package:hayumi/rodas.dart';
import 'package:hayumi/susp.dart';
import 'package:hayumi/volan.dart';

class TelaTodos extends StatefulWidget {
  const TelaTodos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaTodosState createState() => _TelaTodosState();
}

class _TelaTodosState extends State<TelaTodos> with SingleTickerProviderStateMixin {
  late TabController _tabController; // controla o comportamento dinamico da tela

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); //inicia a tabcontroller, indicando que tera 5 abas, (index de 0 a 4)
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { //estrutura da tela com appbar, body e demais elementos
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(   //barra com botôes de categorias principais que ficam no topo da tela
        automaticallyImplyLeading: false,
        title: const Text('Todos',style: TextStyle( //titulo que fica na appbar
            color: Color(0xFFFFCC00), 
          ),),
        backgroundColor: const Color.fromARGB(255, 0, 36, 84),
        actions: [
          Image.asset( //coloca o icone da logo
            'img/logo_splash.jpg',
            width: 40.0,
            height: 40.0,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar( //s-exibe abas de navegação, todos, rodas, pneus, motor e freios
            controller: _tabController,
            isScrollable: false,
            labelColor: const Color.fromARGB(255, 255, 204, 0),
            unselectedLabelColor: const Color.fromARGB(255, 255, 204, 0),
            indicator: const BoxDecoration(),  // Remove o marcador de aba selecionada
            onTap: (index) {
              _navegacaoentretelas(index);  // Chama a função de navegação ao clicar em uma aba (FUNÇÃO FOI CRIADA MAIS ABAIXO)
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
        child: Column(
          children: [
            Expanded(
              child: GridView.count( // exibe os botões com imagens em estrutura de "grade", contendo duas colunas
                crossAxisCount: 2, // Define 2 colunas de img
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  // Usando o widget de botão com imagem com um texto abaixo
                  ImageButton(
                   imagePath: 'img/roda_capa.jpg',
                    label: 'Roda',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold), // cor do texto
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagRodas()),
                      );
                    },
                  ),

                  ImageButton(
                    imagePath: 'img/pneu_capa.jpg',
                    label: 'Pneus',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagPneus()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/motor_capa.jpg',
                    label: 'Motor',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagMotor()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/freio_capa.jpg',
                    label: 'Freios',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagFreios()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/bateria_capa.jpg',
                    label: 'Bateria',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagBateria()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/radiador_capa.jpg',
                    label: 'Radiador',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagRadiador()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/escape_capa.jpg',
                    label: 'Escapamentos',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagEscape()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/filtroar_capa.jpg',
                    label: 'Filtros de ar',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagFiltros()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/lampada_capa.jpg',
                    label: 'Lâmpadas',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagLampada()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/oleom_capa.jpg',
                    label: 'Óleos',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagOleos()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/retro_capa.jpg',
                    label: 'Retrovisores',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagRetro()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/susp_capa.jpg',
                    label: 'Suspensões',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagSusp()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/volan_capa.jpg',
                    label: 'Volantes',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PagVolan()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função de navegação entre telas de acordo com os botões da appbar
  void _navegacaoentretelas(int index) {
    if (index == 0) return; // Fica na mesma tela se for "Todos" por causa do seu index, assim evitando "navegar" para a mesma tela
    switch (index) {  
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagRodas()), //case 1
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagPneus()), // case 2
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagMotor()), // case 3
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PagFreios()), // case 4
        );
        break; // Para a execução da função
    }
  }
}

// Widget para os botões com imagem e texto
class ImageButton extends StatelessWidget { //classe criada com o nome de imagebutton para representar o botão com imagem
  final String imagePath; //caminho da imagem a ser utilizada
  final String label; // texto que é exibido embaixo da imagem
  final VoidCallback onPressed; //navegação que é executada ao clicar no botão
  final TextStyle? labelStyle; // parâmetro para mudar cor ou estilo do texto

  const ImageButton({ //construtor do imagebutton
    super.key,
    required this.imagePath, //caminho da imagem a ser utilizada
    required this.label, // texto que é exibido embaixo da imagem
    required this.onPressed, //navegação que é executada ao clicar no botão
    this.labelStyle, // parâmetro criado para mudar o estilo do texto em baixo da imagem
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo do botão
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
              fit: BoxFit.contain, // A imagem vai cobrir o espaço disponível no botão
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



