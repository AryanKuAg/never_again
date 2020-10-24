import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:never_again/screens/noSelectionScreen.dart';
import 'package:never_again/screens/submitMasturbationData.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:never_again/widgets/timerOfHomePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(
          titleText: 'Home',
          ctx: context,
          myWidgetList: [
            NeumorphicButton(
              child: Icon(Icons.ac_unit_outlined),
              onPressed: () {},
            ),
          ]),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TimerOfHomePage(myDateFormat: 'MMM dd, yyyy'),
            Text(
              'Did You Masturbate Today?',
              style: TextStyle(fontSize: textScaleFactor * 30),
            ),
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  'asset/tiger.png',
                  fit: BoxFit.contain,
                )),
            Text(
              'Time Left to Unlock Next Reward:',
              style: TextStyle(fontSize: textScaleFactor * 25),
            ),
            TimerOfHomePage(myDateFormat: 'hh:mm:ss'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleCard(mediaQuery, 'YES', () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => SubmitMasturbationData()));
                }),
                SimpleCard(mediaQuery, 'NO', () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => NoSelectionScreen()));
                })
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  Container SimpleCard(Size mediaQuery, String myText, Function execute) {
    return Container(
      width: mediaQuery.width * 0.4,
      height: mediaQuery.height * 0.2,
      child: NeumorphicButton(
        child: Center(
            child: NeumorphicText(
          myText,
          style: NeumorphicStyle(
              depth: 2, intensity: 1, surfaceIntensity: 1, color: Colors.black),
          textStyle: NeumorphicTextStyle(fontSize: mediaQuery.height * 0.05),
        )),
        onPressed: execute,
      ),
    );
  }
}

// Widget time(DateTime myDateTime) {
//   Timer.periodic(Duration(seconds: 1), (timer) {se }),
//
//   return Text('');
// }
