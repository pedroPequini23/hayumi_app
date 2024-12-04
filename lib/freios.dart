import 'package:flutter/material.dart';
import 'package:hayumi/freio1.dart';
import 'package:hayumi/freio2.dart';
import 'package:hayumi/freio3.dart';
import 'package:hayumi/freio4.dart';
import 'package:hayumi/freio5.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/rodas.dart';
import 'package:hayumi/todos.dart';

class PagFreios extends StatefulWidget {
  const PagFreios({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagFreiosState createState() => _PagFreiosState();
}

class _PagFreiosState extends State<PagFreios> with SingleTickerProviderStateMixin {
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
    if (index == 4) return; // Evita recarregar a pag que ta selecianada pelo numero do case
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
        title: const Text('Freios',style: TextStyle(
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
            indicator: const BoxDecoration(), // Remove a marca de aba selecionada
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
          crossAxisCount: 2, // Define 2 colunas de imagem
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            ImageButton(
              imagePath: 'img/freio_dianteiro_328mm.jpg',
              label: 'Par de discos de freio dianteiro de 328mm',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Freio1()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/freio_disco_dianteiro_328mm.jpg',
              label: 'Freio a disco dianteiro de 328mm Volvo XC60',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Freio2()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/freio_dianteiro_280mm.jpg',
              label: 'Freio a disco dianteiro de 280mm',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Freio3()),
                 );
              },
            ),
            ImageButton(
              imagePath: 'img/freio_freemax_287mm.jpg',
              label: 'Freio a disco freemax de 287mm',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Freio4()),
                );
               
              },
            ),
            // Botão de imagem 
            ImageButton(
              imagePath: 'img/freio_disco_ventilado_280mm.jpg',
              label: 'Freio a disco ventilado de 280mm',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Freio5()),
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
  final TextStyle? labelStyle; // Novo parâmetro opcional para o estilo do texto

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