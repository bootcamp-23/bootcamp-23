import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Login Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return "Signup Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signGuest() async {
    await _firebaseAuth.signInAnonymously();
    //   Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => Home()));
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser!;
    return user != null;
  }
}

final firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final authServiceProvider = ChangeNotifierProvider(
  (ref) => AuthenticationService(ref.read(firebaseAuthProvider)),
);
