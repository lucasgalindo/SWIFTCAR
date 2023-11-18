import 'package:flutter/material.dart';

class ConfirmarSolic extends StatefulWidget {
  const ConfirmarSolic({Key? key}) : super(key: key);

  @override
  State<ConfirmarSolic> createState() => _ConfirmarSolicState();
}

class _ConfirmarSolicState extends State<ConfirmarSolic> {
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
                  'Socorro Mecânico',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
                child: Container(
                alignment: Alignment.center,
                width: 234,
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
                  'MINHA SOLICITAÇÃO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
              SizedBox(height: 76),
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
