import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq_merchant/core/constants/database_constants.dart';

class SignupApiService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignupApiService({required this.auth, required this.firestore});

  Future<UserCredential> signup(String email, String password) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await firestore
        .collection(DatabaseConstants.emailsCollection)
        .doc(email)
        .set({'password': password});

    return response;
  }
}
