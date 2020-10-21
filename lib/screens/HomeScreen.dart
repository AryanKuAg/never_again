import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import 'package:never_again/screens/noSelectionScreen.dart';
import 'package:never_again/screens/submitMasturbationData.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
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
            Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: TextStyle()),
            Text('Did you did it today?'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NeumorphicIcon(
                Icons.threed_rotation,
                style: NeumorphicStyle(
                    depth: 2, surfaceIntensity: 1, intensity: 1),
                size: 100,
              ),
            ),
            Text('Time Left to Unlock Next Award:'),
            Text('gggggggggggggggggggg'),
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
