import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/screens/noSelectionScreen.dart';

import 'package:never_again/screens/submitMasturbationData.dart';
import 'package:never_again/widgets/dateOfHomePage.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:never_again/widgets/showRewardsChip.dart';
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
            DateOfHomePage(),
            Text(
              'Did You Masturbate Today?',
              style: TextStyle(
                  fontSize: textScaleFactor * 30, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.all(22),
                width: double.infinity,
                height: 100,
                child: Image.asset(
                  'asset/tiger.png',
                  fit: BoxFit.contain,
                )),
            ShowRewardsChip(),
            Text(
              'Time Left to Unlock Next Reward:',
              style: TextStyle(fontSize: textScaleFactor * 25),
            ),
            SizedBox(
              height: 2,
            ),
            TimerOfHomePage(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  simpleCard(mediaQuery, 'YES', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SubmitMasturbationData()));
                  }),
                  simpleCard(mediaQuery, 'NO', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => NoSelectionScreen()));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container simpleCard(Size mediaQuery, String myText, Function execute) {
    return Container(
      width: mediaQuery.width * 0.4,
      height: mediaQuery.height * 0.2,
      child: NeumorphicButton(
        child: Center(
            child: Text(
          myText,
          style: TextStyle(
              fontSize: mediaQuery.height * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75)),
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
