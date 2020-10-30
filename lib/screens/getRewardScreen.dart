import 'package:flutter/material.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class GetRewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNeumorphicAppBar(ctx: context, titleText: 'Rewards'),
      body: Center(child: Text('heyr')),
    );
  }
}
