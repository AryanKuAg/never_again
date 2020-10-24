import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IconNameFunction extends StatelessWidget {
  final Image myIcon;
  final String myName;
  final Function myFunction;
  IconNameFunction({this.myFunction, this.myIcon, this.myName});
  final NeumorphicStyle myNeumorphicStyle = NeumorphicStyle(
      depth: 1, intensity: 1, surfaceIntensity: 1, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return FlatButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          myIcon,
          SizedBox(
            height: 2,
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
