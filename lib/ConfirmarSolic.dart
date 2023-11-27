import 'package:flutter/material.dart';
import 'package:swiftcar/AguardarMecanico.dart';

import 'SolicitarMecanico.dart';
import 'login.dart';

class ConfirmarSolic extends StatefulWidget {
  const ConfirmarSolic({Key? key}) : super(key: key);

  @override
  State<ConfirmarSolic> createState() => _ConfirmarSolicState();
}

class _ConfirmarSolicState extends State<ConfirmarSolic> {
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
        child: Container(
          child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/swiftcar.png'),
              SizedBox(height: 76),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 100),
                    width: 2,
                  ),
                ),
                child: Text(
                  'Socorro Mecânico',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                width: 300,
                height: 268,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 100),
                    width: 2,
                  ),
                ),
                child: Column(
                      children: [
                        Container(
                alignment: Alignment.center,
                width: 234,
                height: 50,
                decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 100),
                    width: 2,
                  ),
                ),
                child: Text(
                  'MINHA SOLICITAÇÃO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "VALOR: R\$60,00",
                      style: TextStyle(
                        
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    

                    Text(
                      "LOCALIZAÇÃO: Rua Bom Jesus, 48.",
                      style: TextStyle(
                        
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    

                      ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {

                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AguardarMecanico()),
                              );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(21, 136, 220, 1),
                ),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      'CONFIRMAR SOLICITAÇÃO',
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
