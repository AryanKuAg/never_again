import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        drawer: MyDrawer(),
        appBar: CustomNeumorphicAppBar(titleText: 'Discover', ctx: context),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: mediaQuery.width * 0.04,
              mainAxisSpacing: mediaQuery.height * 0.02),
          padding: EdgeInsets.all(5),
          children: [
            neumorphicCardOfDiscoverPage('Audio Stories'),
            neumorphicCardOfDiscoverPage('Fight Urges'),
            neumorphicCardOfDiscoverPage('Facts'),
            neumorphicCardOfDiscoverPage('Describe Your Feelings'),
            neumorphicCardOfDiscoverPage('ksjfah'),
            neumorphicCardOfDiscoverPage('ksjfah'),
            neumorphicCardOfDiscoverPage('ksjfah'),
            neumorphicCardOfDiscoverPage('ksjfah'),
          ],
        ));
  }
}

Widget neumorphicCardOfDiscoverPage(String myText) {
  return Neumorphic(
    child: Center(
      child: Text(myText),
    ),
  );
}
