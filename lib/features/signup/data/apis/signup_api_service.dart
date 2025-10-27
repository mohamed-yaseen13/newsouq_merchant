import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq_merchant/core/constants/database_constants.dart';
import 'package:newsouq_merchant/core/helpers/shared_pref.dart';

class SignupApiService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignupApiService({required this.auth, required this.firestore});

  Future<UserCredential> signup(
    String email,
    String password,
    String name,
  ) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await firestore
        .collection(DatabaseConstants.emailsCollection)
        .doc(email)
        .set({'password': password, 'role': 'seller', 'name': name});

    SharedPref.setUserEmail(email);
    SharedPref.setUserName(name);

    return response;
  }
}
