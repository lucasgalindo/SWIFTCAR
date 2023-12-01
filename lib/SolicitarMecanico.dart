import 'package:flutter/material.dart';
import 'package:swiftcar/models/armazenar.dart';
import 'package:swiftcar/models/solicit.dart';
import 'intermedio.dart';
import 'login.dart';
import 'models/solicitacao.dart'; 

class SolicitarMecanico extends StatefulWidget {
  const SolicitarMecanico({Key? key}) : super(key: key);

  @override
  State<SolicitarMecanico> createState() => _SolicitarMecanicoState();
}

class _SolicitarMecanicoState extends State<SolicitarMecanico> {
  String localization = '';
  String placa = '';
  String model = '';
  LocalizacaoUser localizacaoUser = LocalizacaoUser();
  SolicitMec solicitMec = SolicitMec(id: '', localizacao: '', placa: '', modelo: '');
  SolicitacaoMec solicitacaoMec = SolicitacaoMec();

  @override
  void initState() {
    super.initState();
    obterLocalizacao();
  }

  void obterLocalizacao() async {
    await localizacaoUser.getPosicao();
    setState(() {
      localization = localizacaoUser.endereco;
    });
  }

  void _mostrarPopUpConfirmacao() async {
    if (localization.isNotEmpty && _isValidPlaca(placa) && model.isNotEmpty) {
      solicitMec = SolicitMec(
        id: '', 
        localizacao: localization,
        placa: placa,
        modelo: model,
      );

      await solicitacaoMec.saveSolicitMecToFirestore(solicitMec);

      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmação'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Localização: $localization'),
                const SizedBox(height: 10),
                Text('Placa do Veículo: $placa'),
                const SizedBox(height: 10),
                Text('Modelo/Ano: $model'),
                const SizedBox(height: 10),
                const Text(
                  'Observação: Ao confirmar a chamada de um mecânico, solicitado por meio do SwiftCar, garante a resolução de problemas que sejam passíveis de correção nas condições oferecidas por esse tipo de atendimento. Essa modalidade de serviço não contempla situações que exigem equipamentos especializados ou maquinários disponíveis apenas em oficinas.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Intermedio()),
                  );
                },
                child: const Text('Confirmar'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todos os campos são obrigatórios ou a placa está em formato inválido.'),
        ),
      );
    }
  }

  bool _isValidPlaca(String placa) {
    RegExp placaRegex = RegExp(r'^[A-Z]{3}\d[A-Z]\d{2}$');
    return placaRegex.hasMatch(placa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'assets/swiftcar.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Página Inicial'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SolicitarMecanico()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.58),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
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
                const SizedBox(height: 76),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      localization = text;
                    });
                  },
                  controller: TextEditingController(text: localization),
                  decoration: const InputDecoration(
                    labelText: 'Digite a sua localização:',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      placa = text;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Digite a placa do seu veículo:',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      model = text;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Digite o modelo e ano do seu veículo (MODELO/ANO): ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 76),
                ElevatedButton(
                  onPressed: _mostrarPopUpConfirmacao,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(21, 136, 205, 1),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Solicitar o mecânico',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
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
