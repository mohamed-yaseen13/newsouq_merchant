import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq_merchant/core/helpers/shared_pref.dart';

class LoginApiService {
  final FirebaseAuth auth;

  LoginApiService({required this.auth});

  Future<UserCredential> login(String email, String password) async {
    SharedPref.setUserEmail(email);
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
