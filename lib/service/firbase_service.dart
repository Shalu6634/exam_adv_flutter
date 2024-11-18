import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireService {
  CloudFireService._();

  static CloudFireService cloudFireService = CloudFireService._();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> addContactDetailInFireBase(
      String name, String phone, String email) async {
    var refId = await firestore
        .collection(email)
        .add({'name': name, 'phone': phone, 'email': email});
    return refId.id;
  }
}