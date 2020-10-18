import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:never_again/provider/loginLogic.dart';
import 'package:never_again/tabbar.dart';

enum Gender {
  male,
  female,
}

class LoginInfoScreen extends StatefulWidget {
  @override
  _LoginInfoScreenState createState() => _LoginInfoScreenState();
}

class _LoginInfoScreenState extends State<LoginInfoScreen> {
  double userAge = 20.0;
  Gender selectedGender;
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: mediaQuery.height * 0.08,
                  child: Icon(Icons.camera_alt),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Avatar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textScaleFactor * 18),
              ),
              SizedBox(
                height: 20,
              ),
              Neumorphic(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: 'Username', border: InputBorder.none),
                  )),
              // SizedBox(
              //   height: 10,
              // ),
              // Neumorphic(
              //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //     child: TextField(
              //       decoration: InputDecoration(
              //           hintText: 'Username', border: InputBorder.none),
              //     )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Neumorphic(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'AGE: ${userAge.ceil().toString()}',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      NeumorphicSlider(
                        max: 100.0,
                        min: 16.0,
                        value: userAge,
                        style: SliderStyle(accent: Colors.pinkAccent),
                        thumb: Chip(
                          label: Text(
                            'AGE:${userAge.round().toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          backgroundColor: Colors.pinkAccent.withOpacity(0.8),
                        ),
                        onChanged: (change) {
                          setState(() {
                            userAge = change;
                          });

                          print(userAge.toString());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (viewInsets.bottom == 0)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: NeumorphicButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.mars,
                                  size: mediaQuery.height * 0.08,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            style: NeumorphicStyle(
                              depth: selectedGender == Gender.male ? 0 : null,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: NeumorphicButton(
                            style: NeumorphicStyle(
                              depth: selectedGender == Gender.female ? 0 : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.venus,
                                  size: mediaQuery.height * 0.08,
                                  color: Colors.pinkAccent,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              if (viewInsets.bottom == 0)
                NeumorphicButton(
                  child: Text(
                    'SIGN UP NOW',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textScaleFactor * 18),
                  ),
                  onPressed: () {
                    if (textEditingController.text.length > 2 &&
                        selectedGender != null) {
                      LoginLogic.loginAnonymously(
                          username: textEditingController.text,
                          age: userAge.round(),
                          isMale: selectedGender == Gender.male ? true : false);
                    } else {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Text('Something Is Missing'),
                                content: Text('Try to Re-check all the fields'),
                              ));
                    }
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
