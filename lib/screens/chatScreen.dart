import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(
          ctx: context,
          titleText: 'Chat',
          myWidgetList: [
            NeumorphicButton(
              child: Icon(Icons.add_shopping_cart_rounded),
              onPressed: () {},
            )
          ]),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: Neumorphic(
                child: Text('hey'),
              ))
        ],
      ),
    );
  }
}
