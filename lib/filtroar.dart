import 'package:flutter/material.dart';
import 'package:hayumi/filtro1.dart';
import 'package:hayumi/filtro2.dart';
import 'package:hayumi/filtro3.dart';
import 'package:hayumi/filtro4.dart';
import 'package:hayumi/filtro5.dart';
import 'package:hayumi/freios.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/pneus.dart';

import 'package:hayumi/todos.dart';
import 'package:hayumi/rodas.dart';

class PagFiltros extends StatefulWidget {
  const PagFiltros({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagFiltrosState createState() => _PagFiltrosState();
}

class _PagFiltrosState extends State<PagFiltros> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
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
    // ignore: unrelated_type_equality_checks
    if (index == false) return; // Evita recarregar a pag que ta selecianada 
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        title: const Text('Filtros de ar',style: TextStyle(
            color: Color(0xFFFFCC00), 
          ),),
          backgroundColor: const Color.fromARGB(255, 0, 36, 84),
          elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
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
            'img/logo_splash.jpg', 
            width: 40.0,
            height: 40.0,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            isScrollable: false, 
            labelColor: const Color.fromARGB(255, 255, 204, 0),
            unselectedLabelColor: const Color.fromARGB(255, 255, 204, 0),
            indicator: const BoxDecoration(), // Remove o marcador de aba selecionada
            onTap: (index) {
              _navegacaoentretelas(index); // Chama a função de navegação
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
          crossAxisCount: 2, // Define 2 colunas de img
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            ImageButton(
              imagePath: 'img/filtro1.jpg',
              label: 'Filtro de ar simples wix',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filtro1()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/filtro2.jpg',
              label: 'Filtro de Ar de Alta Eficiência K&S',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filtro2()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/filtro3.jpg',
              label: 'Filtro de Ar AEM DryFlow',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filtro3()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/filtro4.jpg',
              label: 'Filtro de Ar Primário Donaldson',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filtro4()),
                );
              },
            ),
            // Botão com imagem
            ImageButton(
              imagePath: 'img/filtro5.jpg',
              label: 'Filtro de Ar Spectre',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filtro5()),
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
  final String imagePath;
  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle; // parâmetro para mudar cor ou estilo do texto

  const ImageButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Borda retangular
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // A imagem vai cobrir o espaço disponível
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