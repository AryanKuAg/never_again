import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_again/models/reportCardModel.dart';

class ReportCardLogic with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  List _listOfReportCards = <ReportCardModel>[];

  List get reportCardList {
    return [..._listOfReportCards];
  }

  void addReportCard(
      {String reason,
      int customSelection,
      int selectAmount,
      bool public,
      DateTime dateTime,
      String id,
      String username}) {
    try {
      _fireStore.collection('users/${_auth.currentUser.uid}/reportCard').add({
        'dateTime': dateTime,
        'sperms': selectAmount != null ? selectAmount : customSelection,
        'reason': reason,
        'public': public,
        'username': username
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
