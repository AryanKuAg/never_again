import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import './loginInfoScreen.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white70],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('asset/loginLottie.json', width: 250, height: 250),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              //   child: NeumorphicButton(
              //     style: NeumorphicStyle(color: Colors.redAccent),
              //     child: ListTile(
              //       leading: Icon(
              //         FontAwesomeIcons.google,
              //         color: Colors.white,
              //       ),
              //       title: Text('Sign In with Google',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //               fontSize: textScaleFactor * 20)),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              //   child: NeumorphicButton(
              //     style: NeumorphicStyle(color: Colors.blueAccent),
              //     child: ListTile(
              //       leading: Icon(
              //         FontAwesomeIcons.facebook,
              //         color: Colors.white,
              //       ),
              //       subtitle: Text(
              //         '*Not available ',
              //         style: TextStyle(color: Colors.red),
              //       ),
              //       title: Text('Sign In with Facebook',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //               fontSize: textScaleFactor * 20)),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              // SizedBox(
              //   height: 25,
              //   child: Text('----------OR----------'),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: NeumorphicButton(
                  style: NeumorphicStyle(color: Colors.grey),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.personBooth,
                      color: Colors.white,
                    ),
                    title: Text('Sign In as a Guest',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: textScaleFactor * 20)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => LoginInfoScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
