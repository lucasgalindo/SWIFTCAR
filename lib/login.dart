import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


String email = '';
String senha = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
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
                  onChanged: (text){
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                ),
                
                SizedBox(height: 10),
                
                TextField(
                  onChanged: (text){
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                ),
                
                SizedBox(height: 15),
          
                ElevatedButton(onPressed: () {
                  
                }, 
                child: Text('Entrar'))
              
              ],),
            ),
          ),
        ),
      ),
    );
  }
}