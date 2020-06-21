import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
    } catch(e){
      print(e.toString());
    }
  }

  // Signing in anonymously
  Future signInAnonymously() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
    } catch(e){
      print(e.toString());
    }
  }

}