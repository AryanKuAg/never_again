import 'package:flutter/material.dart';
import 'package:never_again/models/reportCardModel.dart';

class ReportCardLogic with ChangeNotifier {
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
      String id}) {
    //lol
    // print(reason);
    // print(customSelection);
    // print(selectAmount);
    // print(pubOrPri);
    try {
      _listOfReportCards.add(ReportCardModel(
          username: 'Aryan',
          userImage: Image.asset('asset/aryan.jpg'),
          sperms: selectAmount != null ? selectAmount : customSelection,
          reason: reason,
          public: public,
          datetime: dateTime,
          id: id));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
