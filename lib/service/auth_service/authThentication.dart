import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();

  static AuthService authService = AuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign-in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return 'success';
    }
  }

  // createUser
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //logout
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  //currentUser
  Future<User?> getCurrentUser() async {
    User? user = await _firebaseAuth.currentUser;
    if (user != null) {
      log('email $user.email');
    }
    return user;
  }
}
