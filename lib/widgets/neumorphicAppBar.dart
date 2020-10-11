import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget CustomNeumorphicAppBar(
    {String titleText, BuildContext ctx, List<Widget> myWidgetList}) {
  final textScaleFactor = MediaQuery.of(ctx).textScaleFactor;
  return NeumorphicAppBar(
    title: NeumorphicText(
      titleText,
      textStyle:
          NeumorphicTextStyle(fontSize: textScaleFactor * 24, letterSpacing: 2),
      style: NeumorphicStyle(depth: 1, surfaceIntensity: 1, intensity: 1),
    ),
    actions: myWidgetList,
  );
}
