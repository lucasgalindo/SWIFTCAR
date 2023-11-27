import 'package:flutter/material.dart';
import 'package:swiftcar/ConfirmarSolic.dart';
import 'login.dart';

class SolicitarMecanico extends StatefulWidget {
  const SolicitarMecanico({super.key});

  @override
  State<SolicitarMecanico> createState() => _SolicitarMecanicoState();
}

class _SolicitarMecanicoState extends State<SolicitarMecanico> {

  String localization = '';
  String placa = '';
  String model = '';

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
                  MaterialPageRoute(builder: (context) => SolicitarMecanico()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
                SizedBox(height: 76),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      localization = text;
                    });
                  },
              
                  decoration: InputDecoration(
                    labelText: 'Digite a sua localização:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      placa = text;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Digite a placa do seu veículo:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      model = text;
                    });
                  },
                 
                  decoration: InputDecoration(
                    labelText: 'Digite o modelo e ano do seu veículo (MODELO/ANO): ',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 76),
                
  
                ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ConfirmarSolic()),
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