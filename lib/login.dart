import 'package:flutter/material.dart';
import 'package:hayumi/todos.dart';


class Usuario {
  final String email;

  const Usuario(this.email);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailUsu = '';
  String senhaUsu = '';

  @override
  void initState() {
    super.initState();
  }

  // Função de validação
  void validarLogin() {
    if (emailUsu.isEmpty || senhaUsu.isEmpty) {
      // Exibe uma mensagem se os campos estão vazios
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos.")),
      );
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailUsu)) {
      // Exibe uma mensagem se o formato do email não é válido
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, insira um email válido.")),
      );
    } else {
      // Navega para a próxima tela se tudo estiver correto
      Usuario email = Usuario(emailUsu);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaTodos(),
          settings: RouteSettings(arguments: email),
        ),
      );
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.only(
        top: 60,
        left: 40,
        right: 40,
      ),
      color: const Color.fromARGB(255, 0, 36, 84),
      child: Center( // Envolva em um Center para alinhar no centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
          mainAxisSize: MainAxisSize.min, // Ajusta para o tamanho mínimo necessário
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('img/logo_splash.jpg'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 251, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  emailUsu = value;
                });
              },
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 251, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  senhaUsu = value;
                });
              },
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 250, 250, 250),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 255, 251, 0),
                    Color.fromARGB(255, 255, 251, 0),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onPressed: validarLogin, // Chama a função de validação
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
