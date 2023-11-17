import 'package:flutter/material.dart';

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
                      phone = text;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui o seu número de telefone:',
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
                Text(
                  'O que você pretende ser no nosso Aplicativo:',
                  style: TextStyle(fontSize: 16),
                ),
                RadioListTile<TipoUsuario>(
                  title: Text('Usuário (Cliente)'),
                  value: TipoUsuario.cliente,
                  groupValue: tipoUsuarioSelecionado,
                  onChanged: (TipoUsuario? value) {
                    setState(() {
                      tipoUsuarioSelecionado = value;
                    });
                  },
                ),
                RadioListTile<TipoUsuario>(
                  title: Text('Prestador de serviço (Mecânico)'),
                  value: TipoUsuario.mecanico,
                  groupValue: tipoUsuarioSelecionado,
                  onChanged: (TipoUsuario? value) {
                    setState(() {
                      tipoUsuarioSelecionado = value;
                    });
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    
                    if (tipoUsuarioSelecionado != null) {
                      print('Email: $email');
                      print('Telefone: $phone');
                      print('Tipo de usuário: $tipoUsuarioSelecionado');
                      print('Senha: $senha');
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
