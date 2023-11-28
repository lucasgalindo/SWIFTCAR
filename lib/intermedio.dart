import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'ConfirmarSolic.dart';

class Intermedio extends StatefulWidget {
  const Intermedio({Key? key}) : super(key: key);

  @override
  _IntermedioState createState() => _IntermedioState();
}

class _IntermedioState extends State<Intermedio> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ConfirmarSolic()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/swiftcar.png'),
            SizedBox(height: 50),
            Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 247, 235, 235),
              highlightColor: Color.fromARGB(255, 255, 255, 255),
              child: Container(
                width: 150,
                height: 10,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


