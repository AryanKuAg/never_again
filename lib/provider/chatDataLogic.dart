import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:never_again/models/reportCardModel.dart';

class ChatDataLogic with ChangeNotifier {
  List<ReportCardModel> _listOfReportCards = [];

  List get getListOfReportCards {
    return [..._listOfReportCards];
  }

  //all the logic will fall here

  final _fireStore = FirebaseFirestore.instance;

  Future<List> getAllReportCard({BuildContext ctx}) async {
    final allDocs = await _fireStore.collection('users').limit(50).get();

    // print(allDocs.docs[0].id);
    print('-------START-------');
    await Future.forEach(allDocs.docs, (e) async {
      // list of docs of reportcard data
      final somewaste = await _fireStore
          .collection('users/${e.id.trim().toString()}/reportCard')
          .orderBy('dateTime')
          .where('public', isEqualTo: true)
          .get();
      print(somewaste.toString());
      //if list exists...
      if (somewaste.docs.length >= 1) {
        // print(somewaste.docs.forEach((element) {}));
        await Future.forEach(somewaste.docs, (element) {
          print(element.id);
          _listOfReportCards.add(ReportCardModel(
              username: element.data()['username'].toString(),
              id: element.id,
              datetime: (element.data()['dateTime'] as Timestamp).toDate(),
              sperms: element.data()['sperms'],
              reason: element.data()['reason'].toString(),
              public: element.data()['public'],
              userImage: element.data()['userImageUrl']));
        });
      }
    });

    print(_listOfReportCards.length.toString());
    notifyListeners();
    _listOfReportCards.shuffle();
    return _listOfReportCards.reversed.toList();
  }
}
