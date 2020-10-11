import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum GlobalValues { public, private }
enum ReasonOfMasturbation { porn, eroticMovies, mood, fuck }

class SubmitMasturbationData extends StatefulWidget {
  @override
  _SubmitMasturbationDataState createState() => _SubmitMasturbationDataState();
}

class _SubmitMasturbationDataState extends State<SubmitMasturbationData> {
  GlobalValues myRadioValue = GlobalValues.private;
  String dropdownValue = 'No Reason';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: Neumorphic(
                  child: Column(
                    children: [
                      Text('How Much You Waste Today?'),
                      Image.asset(
                        'asset/alotsperm.png',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Neumorphic(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('What Was The Reason Of Masturbation?'),
                        ),
                        DropdownButton(
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
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                  child: Text(
                                value,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            );
                          }).toList(),
                        )
                      ],
                    ),
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
                        padding: const EdgeInsets.all(50.0),
                        child: Text('PRIVATE'),
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
                        padding: const EdgeInsets.all(50.0),
                        child: Text('PUBLIC'),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
