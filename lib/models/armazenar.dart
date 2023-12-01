import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swiftcar/models/solicit.dart'; 

class SolicitacaoMec {
  Future<void> saveSolicitMecToFirestore(SolicitMec solicitMec) async {
    try {
      // Verifica se o usuário está autenticado
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // ignore: avoid_print
        print('Usuário não autenticado. Incapaz de salvar a solicitação.');
        return;
      }

      // Obtém o ID do usuário logado
      String userId = user.uid;

      // Associa o ID do usuário à solicitação
      solicitMec.userId = userId;

      // Coleção de solicitações de mecânicos
      CollectionReference solicitMecCollection =
          FirebaseFirestore.instance.collection('solicit_mec'); // Alterado para 'solicit_mec'

      // Salva a solicitação no Firestore
      await solicitMecCollection.add(solicitMec.toMap());

      // ignore: avoid_print
      print('Solicitação salva com sucesso no Cloud Firestore');
    } catch (e, stackTrace) {
      // Registra detalhes do erro
      // ignore: avoid_print
      print('Erro ao salvar solicitação: $e');
      // ignore: avoid_print
      print('StackTrace: $stackTrace');
    }
  }
}
