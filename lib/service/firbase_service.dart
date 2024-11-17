import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class FireService {
  FireService._();

  static FireService fireService = FireService._();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<QuerySnapshot<Map<String, dynamic>>> readDataFromStore() {
    return _firestore
        .collection("users")
        .doc(AuthService.authService.getCurrentUser()!.email)
        .collection("expense")
        .snapshots();
  }
}
