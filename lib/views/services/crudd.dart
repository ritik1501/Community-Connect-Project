import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class crudeMethods {
  Future<void> addData(bookData) async {
    bookData = new Map<String, dynamic>.from(bookData);
    await FirebaseFirestore.instance
        .collection('Book-Donation')
        .add(bookData) //data to be entered
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection('Book-Donation')
        .getDocuments();
  }
}
