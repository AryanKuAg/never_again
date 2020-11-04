import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import './loginInfoScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              //   margin: EdgeInsets.all(10),
              //   child: NeumorphicButton(
              //     child: Text(
              //       'Google Sign Up',
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   child: NeumorphicButton(
              //     child: Text('Facebook Sign up',
              //         style: TextStyle(fontWeight: FontWeight.bold)),
              //     onPressed: () {},
              //   ),
              // ),
              Container(
                margin: EdgeInsets.all(10),
                child: NeumorphicButton(
                  child: Text('GUEST',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 2)),
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
