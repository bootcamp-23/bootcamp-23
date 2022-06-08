

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreService(this._firebaseFirestore);

  dynamic data;

  Future<dynamic> getData() async {

    final Future<QuerySnapshot<Map<String, dynamic>>> db =   _firebaseFirestore.collection("users").get();

  }


}