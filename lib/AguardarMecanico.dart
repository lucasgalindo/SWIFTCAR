import 'package:flutter/material.dart';

class AguardarMecanico extends StatefulWidget {
  const AguardarMecanico({super.key});

  @override
  State<AguardarMecanico> createState() => _AguardarMecanicoState();
}

class _AguardarMecanicoState extends State<AguardarMecanico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
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
                  'Solicitação Realizada',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 76),
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
              SizedBox(height: 76),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(21, 136, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 100),
                    width: 2,
                  ),
                ),
                child: Text(
                  'Aguarde o mecânico...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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