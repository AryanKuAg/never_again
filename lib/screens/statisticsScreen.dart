import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  final controller1 = ScrollController();

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  void scrollToDown() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller1.animateTo(
        controller1.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
        child: Icon(Icons.keyboard_arrow_down),
        onPressed: scrollToDown,
      ),
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(titleText: 'Statistics', ctx: context),
      body: SingleChildScrollView(
        controller: controller1,
        physics: BouncingScrollPhysics(),
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
