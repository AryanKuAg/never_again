import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class ChatStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNeumorphicAppBar(
          titleText: 'Store', ctx: context, myWidgetList: []),
      body: Container(child: null),
    );
  }
}
