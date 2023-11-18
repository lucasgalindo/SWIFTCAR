import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


TextEditingController emailController = TextEditingController();
TextEditingController senhaController = TextEditingController();


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

                  controller: emailController,
                  
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                ),
                
                SizedBox(height: 10),
                
                TextField(
                  
                  controller: senhaController,
                 
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                ),
                
                SizedBox(height: 15),
          
                ElevatedButton(onPressed: () {
                  
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(21,136,205, 1),
                ),
              
                child: SizedBox(
                  
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      ),
                  ),
                ))
              
              ],),
            ),
          ),
        ),
      ),
    );
  }
}