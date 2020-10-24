import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChartOfMasturbation extends StatefulWidget {
  @override
  _ChartOfMasturbationState createState() => _ChartOfMasturbationState();
}

class _ChartOfMasturbationState extends State<ChartOfMasturbation> {
  final fireStore = FirebaseFirestore.instance;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return FutureBuilder(
        future: fireStore
            .collection('users/${auth.currentUser.uid}/reportCard')
            .orderBy('dateTime', descending: false)
            .limit(5)
            .get(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          //list of sperm data
          final List mysperms = (snapshot.data as QuerySnapshot)
              .docs
              .map((e) => e.data()['sperms'] * 1620)
              .toList();
          print(mysperms);

          //get list value in the scale of 1 to 6 for the graph of sperm amount

          final List myIndexOfAmount =
              (snapshot.data as QuerySnapshot).docs.map((e) {
            final _data = (e.data()['sperms'] * 1620 as int);

            int o = 6;

            mysperms.forEach((element) {
              if (_data < element) o--;
            });

            return o;
          }).toList();

          print('index  == $myIndexOfAmount');

//4k, 2M ,3B stuff like that so don't worry
          final List sperms = (snapshot.data as QuerySnapshot).docs.map((e) {
            final _data = (e.data()['sperms'] * 1620 as int);
            if (_data.toString().length > 9) {
              return '${_data.toString().substring(0, _data.toString().length - 9)}B';
            } else if (_data.toString().length > 6) {
              return '${_data.toString().substring(0, _data.toString().length - 6)}M';
            } else if (_data.toString().length > 3) {
              return '${_data.toString().substring(0, _data.toString().length - 3)}K';
            } else {
              return _data.round().toString();
            }
          }).toList();
          sperms.sort((a, b) => a.compareTo(b));

          print(sperms);

          return Container(
            margin: EdgeInsets.all(mediaQuery.height * 0.01),
            width: double.infinity,
            child: Neumorphic(
              child: LineChart(LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.black.withOpacity(0.1),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.white70,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return '2st';
                        case 5:
                          return '3nd';
                        case 8:
                          return '4rd';
                      }
                      return '';
                    },
                    margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return '${sperms.first}';
                        case 3:
                          return '${sperms[(sperms.length ~/ 2).round()]}';
                        case 5:
                          return '${sperms.last}';
                      }
                      return '';
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                borderData: FlBorderData(
                    show: false,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 0)),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, myIndexOfAmount[0].toDouble() ?? 0),
                      FlSpot(2.2, myIndexOfAmount[1].toDouble() ?? 0),
                      FlSpot(5, myIndexOfAmount[2].toDouble() ?? 0),
                      FlSpot(7, 3.1),
                      FlSpot(8.5, myIndexOfAmount[3].toDouble() ?? 0),
                      FlSpot(9.5, 3),
                      FlSpot(11, myIndexOfAmount[4].toDouble() ?? 0),
                    ],
                    isCurved: true,
                    colors: [
                      Colors.pinkAccent,
                    ],
                    barWidth: 00,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      gradientTo: Offset(0, 1.8),
                      gradientFrom: Offset(0, 0),
                      show: true,
                      colors: [
                        Colors.pinkAccent,
                        Colors.pinkAccent.withOpacity(0.1)
                      ],
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }
}
