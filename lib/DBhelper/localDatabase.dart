import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_again/models/rewardModel.dart';
import 'package:never_again/provider/rewardsList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  // DateTime myDateTime = DateTime.now();
  List<RewardModel> myRewards;

  Future<void> insertDateTime(DateTime _myDateTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('masturbation_time', _myDateTime.toString());

    notifyListeners();
  }

  void insertMyRewards(List<RewardModel> rewardList) {
    myRewards = rewardList;

    notifyListeners();
  }

  // Future<void> uploadListToServer() async {
  //   DocumentReference documentReference =
  //       _firestore.collection('users').doc(_firebaseAuth.currentUser.uid);
  //   final masturbationTime = await getMasturbationTimeInString;
  //
  //   List _listOfRewards = rewardList
  //       .where((element) {
  //         return element.myDuration <
  //             DateTime.now().difference(masturbationTime);
  //       })
  //       .map((e) => e.id)
  //       .toList();
  //   print('_listofrewards:$_listOfRewards');
  //
  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //     // Get the document
  //     DocumentSnapshot snapshot = await transaction.get(documentReference);
  //
  //     if (!snapshot.exists) {
  //       throw Exception("User does not exist!");
  //     }
  //     List _data = snapshot.data()['rewards'];
  //
  //     List newFollowerCount = _data + _listOfRewards;
  //
  //     // Perform an update on the document
  //     transaction.update(documentReference, {'rewards': newFollowerCount});
  //
  //     // Return the new count
  //   });
  // }

  Future<DateTime> get getMasturbationTimeInString async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('masturbation_time')) {
      return DateTime.now();
    }

    return DateTime.parse(prefs.getString('masturbation_time'));
  }
}
