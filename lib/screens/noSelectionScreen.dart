import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NoSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SimpleCard(Image.asset(
              'asset/happy.png',
              fit: BoxFit.cover,
            )),
            SimpleCard(Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'asset/eagle.jpg',
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Well Done',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Now, Your Spirit Is Gaining Power. Let The Demon Die Inside Your Body To Become An EAGLE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            SimpleCard(Row(
              children: [
                Expanded(
                    child: NeumorphicButton(
                  margin: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    'Read Stories',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  onPressed: () {},
                )),
                Expanded(
                    child: NeumorphicButton(
                  margin: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    'Generate Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  onPressed: () {},
                )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Expanded SimpleCard(Widget myWidget) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Neumorphic(
        child: myWidget,
      ),
    ));
  }
}
