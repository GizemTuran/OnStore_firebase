import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;

  AuthenticationProvider(this.firebaseAuth);

  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up!";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  //SIGN IN METHOD
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
