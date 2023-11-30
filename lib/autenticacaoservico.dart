import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      return userCredential;
    } catch (error) {
      print('Erro ao cadastrar o usuário: $error');
      rethrow;
    }
  }

  Future<UserCredential> fazerLogin({
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      return userCredential; 
    } catch (error) {
      print('Erro ao fazer login: $error');
      rethrow;
    }
  }

  Future<bool> verificarEmailCadastrado(String email) async {
    try {
      
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: "senha",
      );

      
      await firebaseAuth.currentUser?.delete();

      
      return false;
    } catch (error) {
     
      if (error is FirebaseAuthException) {
        if (error.code == 'weak-password') {
     
        } else if (error.code == 'email-already-in-use') {
          return true;
        }
      }
      return false;
    }
  }
}
