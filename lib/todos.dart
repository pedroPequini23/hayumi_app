import 'package:flutter/material.dart';
import 'package:hayumi/freios.dart';
import 'package:hayumi/motor.dart';
import 'package:hayumi/pneus.dart';
import 'package:hayumi/rodas.dart';

class TelaTodos extends StatefulWidget {
  const TelaTodos({super.key});

  @override
  _TelaTodosState createState() => _TelaTodosState();
}

class _TelaTodosState extends State<TelaTodos> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 239, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos',style: TextStyle(
            color: Color(0xFFFFCC00), 
          ),),
        backgroundColor: Color.fromARGB(255, 0, 36, 84),
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
            labelColor: Color.fromARGB(255, 255, 204, 0),
            unselectedLabelColor: const Color.fromARGB(255, 255, 204, 0),
            indicator: const BoxDecoration(),  // Remove o marcador da aba
            onTap: (index) {
              _navigateToScreen(index);  // Chama a função de navegação
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
              child: GridView.count(
                crossAxisCount: 2, // Define 2 colunas de img
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  // Usando o widget de botão com imagem
                  ImageButton(
                   imagePath: 'img/roda_capa.jpg',
                    label: 'Roda',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold), // cor do texto
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagRodas()),
                      );
                    },
                  ),

                  ImageButton(
                    imagePath: 'img/pneu_capa.jpg',
                    label: 'Pneus',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagPneus()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/motor_capa.jpg',
                    label: 'Motor',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagMotor()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/freio_capa.jpg',
                    label: 'Freios',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagFreios()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/bateria_capa.jpg',
                    label: 'Bateria',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagFreios()),
                      );
                    },
                  ),
                  ImageButton(
                    imagePath: 'img/radiador_capa.jpg',
                    label: 'Radiador',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 36, 84),
                    fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PagFreios()),
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

  // Função de navegação entre telas
  void _navigateToScreen(int index) {
    if (index == 0) return; // Fica na mesma tela se for "Todos"
    switch (index) {
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



