import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:never_again/DBhelper/localDatabase.dart';
import 'package:never_again/models/rewardModel.dart';
import 'package:never_again/provider/rewardsList.dart';
import 'package:provider/provider.dart';
import 'package:quotes/quotes.dart';

class ShowRewardsChip extends StatefulWidget {
  @override
  _ShowRewardsChipState createState() => _ShowRewardsChipState();
}

class _ShowRewardsChipState extends State<ShowRewardsChip> {
  List<RewardModel> _listOfRewards = [];

  DateTime _myDateTime;
  Timer _myTimer;
  var randomQuote;
  var localDatabase;
  @override
  void initState() {
    _myTimer = Timer.periodic(Duration(seconds: 3), (_) => myRefresh());
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    _myDateTime =
        await Provider.of<LocalDatabase>(context).getMasturbationTimeInString;
    localDatabase = Provider.of<LocalDatabase>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _myTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    randomQuote = Quotes.getRandom();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Chip(
          label: Row(
              children: _listOfRewards.length <= 0
                  ? List.generate(
                      5,
                      (index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: CircleAvatar(
                            backgroundColor:
                                Colors.pinkAccent.withOpacity(0.08),
                          )))
                  : _listOfRewards
                      .map((e) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              e.rewardImage,
                              height: 50,
                              width: 50,
                            ),
                          ))
                      .toList()),
        ),
      ),
    );
  }

  void myRefresh() {
    var previousList = _listOfRewards;
    _listOfRewards = rewardList
        .where(
          (e) => e.myDuration < DateTime.now().difference(_myDateTime),
        )
        .toList();

    // print('_listOfRewards$_listOfRewards');
    if (_listOfRewards.length > 0) {
      localDatabase.insertMyRewards(_listOfRewards);
    }
    print(
        'previousList:${previousList.length} ?? newList:${_listOfRewards.length}');

    if (_listOfRewards.length != previousList.length) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: _listOfRewards.length > 0
                    ? Image.asset(
                        _listOfRewards.last.rewardImage,
                        height: 250,
                        width: 250,
                      )
                    : Text(''),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _listOfRewards.length > 0
                          ? _listOfRewards.last.about
                          : '',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text('-------------'),
                    Text(
                      randomQuote.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic),
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
    }

    if (!mounted) return;
    setState(() {});
  }
}
