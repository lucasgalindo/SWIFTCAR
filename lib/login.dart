import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swiftcar/SolicitarMecanico.dart';
import 'cadastro.dart';
import 'autenticacaoservico.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticateService authService = AuthenticateService();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void fazerLogin() async {
    try {
     
      if (emailController.text.isEmpty || senhaController.text.isEmpty) {
        
        // ignore: avoid_print
        print('Por favor, preencha usuário e senha');
        return;
      }

      UserCredential userCredential = await authService.fazerLogin(
        email: emailController.text,
        senha: senhaController.text,
      );

      
      User? user = userCredential.user;

      if (user != null) {
        
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
        // ignore: avoid_print
        print('Login efetuado com sucesso! User ID: ${user.uid}');
      } else {
        
        // ignore: avoid_print
        print('E-mail e/ou senha incorretos. Favor, revise os dados e tente novamente!');
      }
    } catch (error) {
     
      // ignore: avoid_print
      print('Erro ao fazer login: $error');
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
                SizedBox(height: 120),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
    
    if (emailController.text.isEmpty || senhaController.text.isEmpty) {
      
      print('Por favor, preencha usuário e senha');
      return;
    }

    try {
      
      UserCredential userCredential = await authService.fazerLogin(
        email: emailController.text,
        senha: senhaController.text,
      );

      
      User? user = userCredential.user;

      if (user != null) {
        
        Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SolicitarMecanico()),
);

        print('Login efetuado com sucesso! User ID: ${user.uid}');
      } else {
        
        print('E-mail e/ou senha incorretos. Favor, revise os dados e tente novamente!');
      }
    } catch (error) {
      
      print('Erro ao fazer login: $error');
    }
  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(21, 136, 205, 1),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Não tem uma conta? ',
                    style: DefaultTextStyle.of(context).style.merge(
                      TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Cadastre-se aqui.',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CadastroPage()),
                            );
                          },
                      ),
                    ],
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
