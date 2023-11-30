import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AguardarMecanico extends StatefulWidget {
  const AguardarMecanico({Key? key}) : super(key: key);

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
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Solicitação Realizada',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Você deve efetuar o pagamento no valor de R\$60,00 ao mecânico, via PIX ou em espécie.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
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
                child: Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 0, 0, 0),
                  highlightColor: Color.fromARGB(255, 255, 255, 255),
                  child: Container(
                    child: Text(
                      'Aguarde, o mecânico está vindo até você',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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
