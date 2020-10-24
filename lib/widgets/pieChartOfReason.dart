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
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fireStore
          .collection('users/${auth.currentUser.uid}/reportCard')
          .limit(10)
          .get(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final List _list = (snapshot.data as QuerySnapshot).docs.map((e) {
          return e.data()['reason'];
        }).toList();

        List<Color> colorCollection = [
          Colors.black.withOpacity(0.8),
          Colors.redAccent.withOpacity(0.8),
          Colors.purpleAccent.withOpacity(0.8),
          Colors.pinkAccent.withOpacity(0.8),
          Colors.indigoAccent.withOpacity(0.8),
          Colors.amber.withOpacity(0.8),
          Colors.black.withOpacity(0.8),
        ];

        int j = 0;
        final List<Map<String, dynamic>> _listWithFrequency =
            _list.toSet().toList().map((e) {
          int i = 0;

          j++;
          _list.forEach((element) {
            if (element == e) i++;
          });

          if (i != 0)
            return {'frequency': i, 'reason': e, 'color': colorCollection[j]};
        }).toList();

        _listWithFrequency
            .sort((a, b) => b['frequency'].compareTo(a['frequency']));

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
                        sections: _listWithFrequency
                            .map((e) => PieChartSectionData(
                                  color: e['color'],
                                  value: (e['frequency'] as int).toDouble(),
                                  title: '40%',
                                  showTitle: false,
                                  radius: 50,
                                  titleStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)),
                                ))
                            .take(5)
                            .toList()),
                  ),
                ),
                Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _listWithFrequency
                        .map(
                          (e) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: Indicator(
                                color: e['color'],
                                text: e['reason'],
                                isSquare: false,
                              ),
                            );
                          },
                        )
                        .toSet()
                        .where((element) =>
                            (element.child as Indicator).text.length > 1)
                        .take(5)
                        .toList()),
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
}
