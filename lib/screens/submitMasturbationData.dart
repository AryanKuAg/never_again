import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/provider/reportCardLogic.dart';
import 'package:provider/provider.dart';

enum GlobalValues { public, private }
enum ReasonOfMasturbation { porn, eroticMovies, mood, fuck }
enum AmountOfSperm { FewDrops, ATeaspoon, FewTeaspoon }

int amountOfSpermGetter(AmountOfSperm myAmountOfSperm) {
  switch (myAmountOfSperm) {
    case AmountOfSperm.FewDrops:
      {
        return 2;
      }
      break;

    case AmountOfSperm.ATeaspoon:
      {
        return 6;
      }
      break;
    case AmountOfSperm.FewTeaspoon:
      {
        return 18;
      }
      break;

    default:
      {
        return null;
      }
      break;
  }
}

class SubmitMasturbationData extends StatefulWidget {
  @override
  _SubmitMasturbationDataState createState() => _SubmitMasturbationDataState();
}

class _SubmitMasturbationDataState extends State<SubmitMasturbationData> {
  GlobalValues myRadioValue = GlobalValues.private;
  String dropdownValue = 'No Reason';
  double mySliderValue = 10.0;
  AmountOfSperm amountOfSperm = AmountOfSperm.FewTeaspoon;
  Future<String> myFuture;
  @override
  void initState() {
    super.initState();
    myFuture = MyUser().getUsername;
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final mediaQuery = MediaQuery.of(context).size;
    final reportCardLogic = Provider.of<ReportCardLogic>(context);

    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Container(
        width: double.infinity,
        child: FutureBuilder(
          future: myFuture,
          builder: (ctx, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Neumorphic(
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NeumorphicRadio(
                                      child: Container(
                                        width: mediaQuery.width * 0.28,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'asset/sperm.png',
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Few Drops\n(less than 2ml)',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      groupValue: amountOfSperm,
                                      value: AmountOfSperm.FewDrops,
                                      onChanged: (val) {
                                        setState(() {
                                          amountOfSperm = val;
                                        });
                                      },
                                    ),
                                  ),
                                  NeumorphicRadio(
                                    child: Container(
                                      width: mediaQuery.width * 0.28,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              'asset/moresperm.png',
                                              height: 60,
                                              width: 60,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'A Teaspoon\n(2ml - 6ml)',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    groupValue: amountOfSperm,
                                    value: AmountOfSperm.ATeaspoon,
                                    onChanged: (val) {
                                      print(val);
                                      setState(() {
                                        amountOfSperm = val;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NeumorphicRadio(
                                      child: Container(
                                        width: mediaQuery.width * 0.28,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'asset/alotsperm.png',
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Few Teaspoon\n(6ml - 20ml)',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      groupValue: amountOfSperm,
                                      value: AmountOfSperm.FewTeaspoon,
                                      onChanged: (val) {
                                        print(val);
                                        setState(() {
                                          amountOfSperm = val;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('---OR---',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              if (amountOfSperm != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: NeumorphicButton(
                                    child: Text(
                                      'Custom Selection',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        amountOfSperm = null;
                                      });
                                    },
                                  ),
                                ),
                              if (amountOfSperm == null)
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: NeumorphicSlider(
                                    min: 1,
                                    max: 100,
                                    style:
                                        SliderStyle(accent: Colors.pinkAccent),
                                    value: mySliderValue,
                                    thumb: Chip(
                                      label: Text(
                                        '${mySliderValue.ceil().toString()}ml',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      backgroundColor:
                                          Colors.pinkAccent.withOpacity(0.8),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        mySliderValue = val;
                                      });
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Neumorphic(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'What Was The Reason Of Masturbation?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textScaleFactor * 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Chip(
                                label: DropdownButton(
                                  underline: Container(
                                    height: 0,
                                  ),
                                  value: dropdownValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'No Reason',
                                    'Porn',
                                    'Erotic Movie',
                                    'Erotic Books',
                                    'Frustration',
                                    'Stress',
                                    'Sexual Thoughts',
                                    'Exam Stress',
                                    'Loneliness',
                                    'Feeling Bored',
                                    'Depression',
                                    'Lack of Sleep',
                                    'Smoking or Weed',
                                    'Hot Shower',
                                    'Alcohol',
                                    'Morning Erection',
                                    'Sexually Touching'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                          child: Text(
                                        value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: NeumorphicRadio(
                            child: Padding(
                              padding: EdgeInsets.all(mediaQuery.height * 0.05),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  NeumorphicIcon(
                                    Icons.lock,
                                    style: NeumorphicStyle(
                                        depth: 1,
                                        surfaceIntensity: 1,
                                        intensity: 1),
                                    size: mediaQuery.height * 0.03,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'PRIVATE',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            groupValue: myRadioValue,
                            value: GlobalValues.private,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                myRadioValue = val;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: NeumorphicRadio(
                            child: Padding(
                              padding: EdgeInsets.all(mediaQuery.height * 0.05),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  NeumorphicIcon(
                                    Icons.public,
                                    style: NeumorphicStyle(
                                        depth: 1,
                                        surfaceIntensity: 1,
                                        intensity: 1),
                                    size: mediaQuery.height * 0.03,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'PUBLIC',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            groupValue: myRadioValue,
                            value: GlobalValues.public,
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                myRadioValue = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(12),
                    child: NeumorphicButton(
                      child: Center(
                          child: Text(
                        'Submit Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      onPressed: () {
                        if (myRadioValue != null) {
                          reportCardLogic.addReportCard(
                              reason: dropdownValue,
                              customSelection: mySliderValue.toInt(),
                              selectAmount: amountOfSpermGetter(amountOfSperm),
                              public: myRadioValue == GlobalValues.public
                                  ? true
                                  : false,
                              id: DateTime.now().toString(),
                              dateTime: DateTime.now(),
                              username: futureSnapshot.data.toString());
                          Navigator.of(context).pop();
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: Text('Something Missing'),
                                    content:
                                        Text('Check all the field again!!!'),
                                  ));
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
