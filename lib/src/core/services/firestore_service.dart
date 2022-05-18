

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firestoreService extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore;

  firestoreService(this._firebaseFirestore);

  dynamic data;

  Future<dynamic> getData() async {

    final Future<QuerySnapshot<Map<String, dynamic>>> db =   _firebaseFirestore.collection("users").get();

  }


}