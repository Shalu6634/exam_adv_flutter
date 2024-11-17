import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService._();

  static AuthService authService = AuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithUserEmailAndPassword(
      String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  User? getCurrentUser()
   {
    User? user = _firebaseAuth.currentUser;
    if(user!=null)
      {
        log('Current Email${user.email}');
      }
    return user;
  }

  Future<void> logOut()
  async {
    await  _firebaseAuth.signOut();
  }
}
