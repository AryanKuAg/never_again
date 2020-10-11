import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IconNameFunction extends StatelessWidget {
  final IconData myIcon;
  final String myName;
  final Function myFunction;
  IconNameFunction({this.myFunction, this.myIcon, this.myName});
  final NeumorphicStyle myNeumorphicStyle = NeumorphicStyle(
      depth: 1,
      intensity: 1,
      surfaceIntensity: 1,
      color: Colors.black.withOpacity(0.3));
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return FlatButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeumorphicIcon(
            myIcon,
            style: myNeumorphicStyle,
            size: mediaQuery.height * 0.06,
          ),
          NeumorphicText(
            myName,
            style: myNeumorphicStyle,
            textStyle: NeumorphicTextStyle(
                fontWeight: FontWeight.bold, fontSize: textScaleFactor * 20),
          )
        ],
      ),
      onPressed: myFunction,
    );
  }
}
