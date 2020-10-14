import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/reportCardLogic.dart';
import 'package:never_again/widgets/iconNameFunction.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final reportCardLogic = Provider.of<ReportCardLogic>(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(
          titleText: 'Profile',
          ctx: context,
          myWidgetList: [
            NeumorphicButton(
              child: Icon(Icons.edit),
              onPressed: () {},
            ),
          ]),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarGlow(
              glowColor: Colors.purple,
              endRadius: 100,
              child: CircleAvatar(
                child: Neumorphic(
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      intensity: 2,
                      border: NeumorphicBorder(width: 2),
                      boxShape: NeumorphicBoxShape.circle()),
                  child: Image.asset('asset/aryan.jpg'),
                ),
                radius: mediaQuery.height * 0.08,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconNameFunction(
                    myFunction: () {
                      print('just pressede');
                    },
                    myIcon: Icons.ac_unit_outlined,
                    myName: 'Jodha',
                  ),
                  IconNameFunction(
                    myFunction: () {},
                    myIcon: Icons.ac_unit_outlined,
                    myName: 'Jodha',
                  ),
                  IconNameFunction(
                    myFunction: () {},
                    myIcon: Icons.ac_unit_outlined,
                    myName: 'Jodha',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconNameFunction(
                    myFunction: () {},
                    myIcon: Icons.ac_unit_outlined,
                    myName: 'Jodha',
                  ),
                  IconNameFunction(
                    myFunction: () {},
                    myIcon: Icons.ac_unit_outlined,
                    myName: 'Jodha',
                  ),
                ],
              ),
            ),
            Chip(
              label: NeumorphicText(
                '${reportCardLogic.reportCardList.length.toString()} Uploads',
                textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold),
                style: NeumorphicStyle(
                    depth: 1,
                    intensity: 1,
                    surfaceIntensity: 1,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Text(
              'AlemantrixAryanAgrawal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  'Hey there i am a superhero who try to build an app for the future and with a hope that it will rock soon'),
            )
          ],
        ),
      ),
    );
  }
}
