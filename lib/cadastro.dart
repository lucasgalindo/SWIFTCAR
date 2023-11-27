import 'package:flutter/material.dart';
import 'package:swiftcar/SolicitarMecanico.dart';
import 'package:swiftcar/login.dart';
import 'autenticacaoservico.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final AuthenticateService authService = AuthenticateService();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  void cadastrarUsuario() async {
    try {
      
      if (nomeController.text.isEmpty ||
          emailController.text.isEmpty ||
          senhaController.text.isEmpty) {
        print('Por favor, preencha todos os campos.');
        return;
      }

      
      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(emailController.text)) {
        print('Por favor, digite um e-mail válido.');
        return;
      }

      
      bool emailCadastrado =
          await authService.verificarEmailCadastrado(emailController.text);

      if (emailCadastrado) {
        print('Este e-mail já está cadastrado. Tente fazer login.');
        return;
      }

      
      await authService.cadastrarUsuario(
        nome: nomeController.text,
        email: emailController.text,
        senha: senhaController.text,
      );

      
      print("Cadastro realizado com sucesso!");

     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (error) {
      
      print('Erro ao cadastrar o usuário: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/swiftcar.png'),
                SizedBox(height: 50),
                TextField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui o seu nome completo:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui o seu e-mail:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: senhaController,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui a sua senha:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: cadastrarUsuario,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(21, 136, 205, 1),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
