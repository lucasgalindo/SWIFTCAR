import 'package:flutter/material.dart';
import 'package:swiftcar/SolicitarMecanico.dart';
import 'package:swiftcar/login.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String email = '';
  String senha = '';
  String phone = '';
  String name = '';
  TipoUsuario? tipoUsuarioSelecionado;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

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
                    setState(() {
                      name = text;
                    });
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
                    setState(() {
                      email = text;
                    });
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
                    setState(() {
                      senha = text;
                    });
                  },
                  controller: senhaController,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui a sua senha:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      senha = text;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirme a sua senha:',
                    border: OutlineInputBorder(),
                  ),
                ),
                
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                  },
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
                )

                

              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TipoUsuario { cliente, mecanico }
