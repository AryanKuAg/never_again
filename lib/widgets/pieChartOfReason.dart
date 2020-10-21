import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/widgets/indicator.dart';

class PieChartOfReason extends StatefulWidget {
  @override
  _PieChartOfReasonState createState() => _PieChartOfReasonState();
}

class _PieChartOfReasonState extends State<PieChartOfReason> {
  int touchedIndex;
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fireStore
          .collection('users/${auth.currentUser.uid}/reportCard')
          .get(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: PieChart(
                    PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: (snapshot.data as QuerySnapshot)
                            .docs
                            .map((e) => PieChartSectionData(
                                  color: const Color(0xff0293ee),
                                  value: 40,
                                  title: '40%',
                                  radius: 50,
                                  titleStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                ))
                            .toList()),
                  ),
                ),
                Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (snapshot.data as QuerySnapshot)
                        .docs
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            child: Indicator(
                              color: Colors.pinkAccent,
                              text: e.data()['reason'],
                              isSquare: false,
                            ),
                          ),
                        )
                        .toList()
                    // <Widget>[
                    //   Indicator(
                    //     color: Colors.pinkAccent,
                    //     text: 'First',
                    //     isSquare: false,
                    //   ),
                    //   SizedBox(
                    //     height: 4,
                    //   ),
                    //   Indicator(
                    //     color: Color(0xfff8b250),
                    //     text: 'Second',
                    //     isSquare: false,
                    //   ),
                    //   SizedBox(
                    //     height: 4,
                    //   ),
                    //   Indicator(
                    //     color: Color(0xff845bef),
                    //     text: 'Third',
                    //     isSquare: false,
                    //   ),
                    //   SizedBox(
                    //     height: 4,
                    //   ),
                    //   Indicator(
                    //     color: Color(0xff13d38e),
                    //     text: 'Fourth',
                    //     isSquare: false,
                    //   ),
                    //   SizedBox(
                    //     height: 18,
                    //   ),
                    // ],
                    ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 50,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
