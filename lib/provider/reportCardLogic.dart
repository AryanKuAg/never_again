import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_again/DBhelper/localDatabase.dart';
import 'package:never_again/models/reportCardModel.dart';
import 'package:never_again/provider/rewardsList.dart';

class ReportCardLogic with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  List _listOfReportCards = <ReportCardModel>[];

  List get reportCardList {
    return [..._listOfReportCards];
  }

  Future<void> addReportCard(
      {String reason,
      int customSelection,
      int selectAmount,
      bool public,
      DateTime dateTime,
      String id,
      String username,
      String userImageUrl,
      DateTime masturbationTime}) async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser.uid);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        if (!snapshot.exists) {
          throw Exception('Users does not exist!');
        }

        List _listOfRewards = rewardList
            .where((element) {
              return element.myDuration <
                  DateTime.now().difference(masturbationTime);
            })
            .map((e) => e.id)
            .toList();

        List reportCard = snapshot.data()['reportCard'];
        reportCard.add({
          'dateTime': dateTime,
          'sperms': selectAmount != null ? selectAmount : customSelection,
          'reason': reason,
          'public': public,
          'username': username,
          'userImageUrl': userImageUrl,
          'rewards': _listOfRewards,
          'controlDuration':
              DateTime.now().difference(masturbationTime).toString()
        });

        transaction.update(documentReference, {'reportCard': reportCard});
      });
      //old one
      // _fireStore.collection('users').doc(_auth.currentUser.uid).update({
      //   'reportCard': {
      //     'dateTime': dateTime,
      //     'sperms': selectAmount != null ? selectAmount : customSelection,
      //     'reason': reason,
      //     'public': public,
      //     'username': username,
      //     'userImageUrl': userImageUrl
      //   }
      // });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
