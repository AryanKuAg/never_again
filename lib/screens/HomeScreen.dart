import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/DBhelper/localDatabase.dart';
import 'package:never_again/provider/rewardsList.dart';

import 'package:never_again/screens/noSelectionScreen.dart';
import 'package:never_again/screens/submitMasturbationData.dart';
import 'package:never_again/widgets/dateOfHomePage.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:never_again/widgets/showRewardsChip.dart';
import 'package:never_again/widgets/timerOfHomePage.dart';
import 'package:provider/provider.dart';
import 'package:quotes/quote_model.dart';
import 'package:quotes/quotes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasRewards = false;
  List _myAwards = [];
  DateTime _myDateTime;

  @override
  void didChangeDependencies() {
    _myDateTime = Provider.of<LocalDatabase>(context).myDateTime;
    for (int i = 0;
        i < DateTime.now().difference(_myDateTime).inDays.remainder(60);
        i++) {
      _myAwards = rewardList
          .where((e) => e.myDuration < _myDateTime.difference(DateTime.now()))
          .toList();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var randomQuote = Quotes.getRandom();

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
                height: _hasRewards ? 100 : 150,
                child: _myAwards.length == 0
                    ? Image.asset(
                        'asset/tiger.png',
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'asset/rewards/eagle.png',
                        fit: BoxFit.contain,
                      )),
            if (_hasRewards) ShowRewardsChip(),
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
                  SimpleCard(mediaQuery, 'YES', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => SubmitMasturbationData()));
                  }),
                  SimpleCard(mediaQuery, 'NO', () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: FlutterLogo(),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(''),
                                  Text(
                                    randomQuote.content,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Text('- ${randomQuote.author}')
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  child: Text('Get It'),
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                )
                              ],
                            ));

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => NoSelectionScreen()));
                    print(Quotes.getRandom().getContent().toString());
                    setState(() {
                      _hasRewards = !_hasRewards;
                    });
                  })
                ],
              ),
            ),
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
