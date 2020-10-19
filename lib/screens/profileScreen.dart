import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:never_again/provider/myUser.dart';


import 'package:never_again/screens/editUserProfileScreen.dart';
import 'package:never_again/widgets/iconNameFunction.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';


class ProfileScreen extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    final viewInsets = MediaQuery.of(context).viewInsets;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomNeumorphicAppBar(
          titleText: 'Profile',
          ctx: context,
          myWidgetList: [
            NeumorphicButton(
              child: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => EditUserProfileScreen()));
              },
            ),
          ]),
      body: FutureBuilder(
        future: MyUser().getTotalUploads,
        builder: (ctx, reportCardSnapshot) {
          if (reportCardSnapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
              future: _firestore.collection('users').doc(_uid).get(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: double.infinity,
                    child: viewInsets.bottom == 0
                        ? Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  '${reportCardSnapshot.data.toString() ?? '0'} Uploads',
                                  textStyle: NeumorphicTextStyle(
                                      fontWeight: FontWeight.bold),
                                  style: NeumorphicStyle(
                                      depth: 1,
                                      intensity: 1,
                                      surfaceIntensity: 1,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                              Text(
                                snapshot.data.data()['username'].toString() ??
                                    'Username',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    snapshot.data.data()['bio'].toString() ??
                                        'My Bio'),
                              )
                            ],
                          )
                        : CircularProgressIndicator(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
