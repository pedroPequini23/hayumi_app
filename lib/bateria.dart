import 'package:flutter/material.dart';
import 'package:hayumi/bateria1.dart';
import 'package:hayumi/bateria2.dart';
import 'package:hayumi/bateria3.dart';
import 'package:hayumi/bateria4.dart';
import 'package:hayumi/bateria5.dart';
import 'package:hayumi/freios.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/todos.dart';
import 'package:hayumi/rodas.dart';

class PagBateria extends StatefulWidget {
  const PagBateria({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PagBateriaState createState() => _PagBateriaState();
}

class _PagBateriaState extends State<PagBateria> with SingleTickerProviderStateMixin {
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
        title: const Text('Baterias',style: TextStyle(
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
              imagePath: 'img/bateria_cral.jpg',
              label: 'Bateria Cral',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bateria4()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/bateria_moura.jpg',
              label: 'Bateria Corsa 60ah',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bateria1()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/bateria_moura_diferente.jpg',
              label: 'Bteria 72ah Start-Stop',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bateria2()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/bateria_moura_diferente2.jpg',
              label: 'Bateria de carro Moura 60ah',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bateria3()),
                );
              },
            ),
            // Botão com imagem
            ImageButton(
              imagePath: 'img/bateria_heliar.jpg',
              label: 'Bateria de carro Heliar Original 60ah',
              labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bateria5()),
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