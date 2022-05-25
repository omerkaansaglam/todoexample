import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoexample/core/constants/app/app_constant.dart';

class HomeSubViewModel extends ChangeNotifier {
  Future<void> addTodoItem(
      {required String title, required String subtitle}) async {
    await FirebaseFirestore.instance
        .collection(AppConstants.COLLECTION_NAME)
        .doc()
        .set({
      "title": title,
      "subTitle": subtitle,
      "createdTime": DateTime.now(),
    });
  }
}
