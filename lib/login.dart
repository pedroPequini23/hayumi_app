import 'package:flutter/material.dart';
import 'package:hayumi/todos.dart';


class Usuario { // classe do usuário, que puxa apenas a info do email
  final String email;

  const Usuario(this.email);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> { //variaveis que armazenam os valores informados
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
        const SnackBar(content: Text("Por favor, preencha todos os campos.")),
      );
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailUsu)) {
      // Exibe uma mensagem se o formato do email não é válido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, insira um email válido.")),
      );
    } else {
      // Navega para a próxima tela se tudo estiver correto
      Usuario email = Usuario(emailUsu);

      Navigator.push(
        context,
        MaterialPageRoute( // navega a para a Telatodos
          builder: (context) => const TelaTodos(),
          settings: RouteSettings(arguments: email),
        ),
      );
    }
  }

  @override
Widget build(BuildContext context) { // interface da tela, a estrutura dela com os seus respectivos elementos
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.only(
        top: 60,
        left: 40,
        right: 40,
      ),
      color: const Color.fromARGB(255, 0, 36, 84),
      child: Center( //alinha no centro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
          mainAxisSize: MainAxisSize.min, // Ajusta para o tamanho mínimo necessário
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('img/logo_splash.jpg'), //caminho da imagem que vai na appbar
            ),
            const SizedBox(height: 20),
            TextFormField(                //campos para a inserção de texto
              keyboardType: TextInputType.emailAddress, //define o teclado apropriado a ser usado
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 251, 0), //cor do texto que aparece no campo
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) { //atualiza o valor da variavel conforme o usuario digita
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
            TextFormField( //segundo campo para a inserção de texto
              keyboardType: TextInputType.text, //define o teclado apropriado
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 251, 0), //cor do texto que aparece no campo
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) { //atualiza o valor da variavel conforme o usuario digita
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
            Container( // personaliza o botão com o gradiente, e com as bordas arredondadas
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
                child: TextButton( //botão estilizado que executa a função validarlogin quando é pressionado
                  onPressed: validarLogin,
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
