import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq_merchant/core/constants/database_constants.dart';
import 'package:newsouq_merchant/core/helpers/shared_pref.dart';

class LoginApiService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  LoginApiService({required this.auth, required this.firestore});

  Future<UserCredential> login(String email, String password) async {
    SharedPref.setUserEmail(email);

    final emailDoc = await firestore
        .collection(DatabaseConstants.emailsCollection)
        .doc(email)
        .get();

    final data = emailDoc.data();
    final name = data?['name'];
    SharedPref.setUserName(name);

    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
