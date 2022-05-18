import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?>signIn(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password,);
      return "Login Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(String email, String password) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signup Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}

final firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final authServiceProvider = ChangeNotifierProvider((ref) => AuthenticationService(ref.read(firebaseAuthProvider)),);
