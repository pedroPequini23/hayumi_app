import 'package:flutter/material.dart';
import 'package:hayumi/freios.dart';
import 'package:hayumi/motor2.0.dart';
import 'package:hayumi/motor2.5.dart';
import 'package:hayumi/motor41.dart';
import 'package:hayumi/motorap.dart';
import 'package:hayumi/motorv6.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/rodas.dart';
import 'package:hayumi/todos.dart';

class PagMotor extends StatefulWidget {
  @override
  _PagMotorState createState() => _PagMotorState();
}

class _PagMotorState extends State<PagMotor> with SingleTickerProviderStateMixin {
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
  void _navigateToScreen(int index) {
    if (index == 3) return; // Evita recarregar a pag que ta selecianada pelo numero do case
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaTodos()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PagRodas()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PagPneus()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PagMotor()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PagFreios()),
        );
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        title: const Text('Motor',style: TextStyle(
            color: Color(0xFFFFCC00), 
          ),),
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
              MaterialPageRoute(builder: (context) => TelaTodos()),
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
          preferredSize: Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            isScrollable: false, 
            labelColor: Color.fromARGB(255, 255, 204, 0),
            unselectedLabelColor: const Color.fromARGB(255, 255, 204, 0),
            indicator: BoxDecoration(), // Remove a marca de aba selecionada
            onTap: (index) {
              _navigateToScreen(index); // Chama a função de navegação
            },
            tabs: [
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
              imagePath: 'img/motor_ap.jpg',
              label: 'Motor AP',
              labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motorap()),
                );
              },
            ),
            ImageButton(
              imagePath: 'img/motor_4_1.jpg',
              label: 'Motor 4.1',
              labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motor41())
                );
              },
            ),
            ImageButton(
              imagePath: 'img/motorv6camaro.jpg',
              label: 'Motor V6 Camaro',
              labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motorv6())
                );
              },
            ),
            ImageButton(
              imagePath: 'img/motor_2_0.jpeg',
              label: 'Motor 2.0',
              labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motor20()),
                );
              },
            ),
            // Botão de imagem genérico
            ImageButton(
              imagePath: 'img/motor_parcial_mitsubishi.jpg',
              label: 'Motor Parcial 2.5',
              labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
              fontWeight: FontWeight.bold),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Motor25()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para os botões com imagem e texto
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
              fit: BoxFit.cover, // A imagem vai cobrir o espaço disponível
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