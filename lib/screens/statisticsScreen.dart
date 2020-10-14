import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/widgets/chartOfMasturbation.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:never_again/widgets/pieChartOfReason.dart';
import 'package:never_again/widgets/reportCardWidget.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(titleText: 'Statistics', ctx: context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChartOfMasturbation(),
            PieChartOfReason(),
            ReportCardWidget()
          ],
        ),
      ),
    );
  }
}
