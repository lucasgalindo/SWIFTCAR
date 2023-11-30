import 'package:flutter/material.dart';
import 'package:swiftcar/login.dart';
import 'autenticacaoservico.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final AuthenticateService authService = AuthenticateService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void cadastrarUsuario() async {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        print('Validação do formulário passou.');

   
        bool emailCadastrado =
            await authService.verificarEmailCadastrado(emailController.text);

        print('E-mail cadastrado: $emailCadastrado');

        
        if (emailCadastrado) {
          mostrarSnackBar('Este e-mail já está cadastrado. Tente fazer login.');
          return;
        }

        
        await authService.cadastrarUsuario(
          nome: nomeController.text,
          email: emailController.text,
          senha: senhaController.text,
        );

        print('Cadastro realizado com sucesso!');

        mostrarSnackBar("Cadastro realizado com sucesso!");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } catch (error) {
      print('Erro ao cadastrar o usuário: $error');
      mostrarSnackBar('Erro ao cadastrar o usuário: $error');
    }
  }

  void mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Digite aqui o seu nome completo:',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, preencha este campo.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Digite aqui o seu e-mail:',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, preencha este campo.';
                      }
                      if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value!)) {
                        return 'Por favor, digite um e-mail válido.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: senhaController,
                    decoration: InputDecoration(
                      labelText: 'Digite aqui a sua senha:',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres.';
                      }
                      return null;
                    },
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
      ),
    );
  }
}
