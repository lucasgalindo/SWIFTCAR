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

      String userID = userCredential.user!.uid;

      return userCredential;
    } catch (error) {
      // ignore: avoid_print
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

      return userCredential; // Retorna o usuário autenticado
    } catch (error) {
      // Em caso de erro, lança uma exceção
      // ignore: avoid_print
      print('Erro ao fazer login: $error');
      rethrow;
    }
  }

  Future<bool> verificarEmailCadastrado(String email) async {
    try {
      // Tenta criar um usuário com o e-mail fornecido
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: "senha", // Adicione uma senha, mas ela não é usada para verificação de e-mail
      );

      // Se a criação do usuário for bem-sucedida, o e-mail ainda não está cadastrado
      // Portanto, excluímos esse usuário recém-criado
      await firebaseAuth.currentUser?.delete();

      return false;
    } catch (error) {
      // Se houver um erro durante a criação do usuário, isso significa que o e-mail já está cadastrado
      return true;
    }
  }
}
