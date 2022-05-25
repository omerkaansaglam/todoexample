import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoexample/core/constants/app/app_constant.dart';

class HomeViewModel extends ChangeNotifier {
  Stream<QuerySnapshot> dataStream =
      FirebaseFirestore.instance.collection('Todo').snapshots();

  Future<void> deleteTodoItem(String? documentId) async {
    await FirebaseFirestore.instance
        .collection(AppConstants.COLLECTION_NAME)
        .doc(documentId)
        .delete();
  }

  Future<void> updateItem(
      {required String title,
      required String subtitle,
      required String id}) async {
    await FirebaseFirestore.instance
        .collection(AppConstants.COLLECTION_NAME)
        .doc(id)
        .update({
      "title": title,
      "subTitle": subtitle,
      "createdTime": DateTime.now(),
    });
  }
}
