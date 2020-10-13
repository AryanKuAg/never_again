import 'package:flutter/material.dart';
import 'package:never_again/models/reportCardModel.dart';

class ReportCardLogic with ChangeNotifier {
  List _listOfReportCards = <ReportCardModel>[];

  List get reportCardList {
    return [..._listOfReportCards];
  }

  void addReportCard(
      {String reason, int customSelection, int selectAmount, String pubOrPri}) {
    //lol
    print(reason);
    print(customSelection);
    print(selectAmount);
    print(pubOrPri);
  }
}
