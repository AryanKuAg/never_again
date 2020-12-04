import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

import 'package:never_again/provider/rewardsList.dart';

import 'package:never_again/screens/editUserProfileScreen.dart';
import 'package:never_again/widgets/advertisementData.dart';
import 'package:never_again/widgets/iconNameFunction.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firestore = FirebaseFirestore.instance;
  BannerAd _bannerAd;
  final _uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3739926644625425~6646484032');

    _bannerAd = AdvertisementData().createBannerAd()
      ..load().then((value) {
        if (value && this.mounted) {
          _bannerAd..show(anchorType: AnchorType.top, anchorOffset: 105.0);
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

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
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (ctx) => EditUserProfileScreen()))
                      .then((value) {
                    setState(() {});
                  });
                },
              ),
            ]),
        body: FutureBuilder(
          future: _firestore.collection('users').doc(_uid).get(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.infinity,
                child: viewInsets.bottom == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
                          AvatarGlow(
                            glowColor: Colors.pink,
                            endRadius: 100,
                            child: CircleAvatar(
                              backgroundImage:
                                  snapshot.data.data()['userImageUrl'] != null
                                      ? NetworkImage(
                                          snapshot.data
                                              .data()['userImageUrl']
                                              .toString(),
                                        )
                                      : AssetImage('asset/boy.png'),
                              radius: mediaQuery.height * 0.08,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // IconNameFunction(
                                //   myFunction: () {
                                //     print('just pressede');
                                //   },
                                //   myIcon: Image.asset('asset/bookmark.png'),
                                //   myName: 'Saved',
                                // ),
                                IconNameFunction(
                                  myFunction: () {
                                    _bannerAd?.dispose();
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                            title: Text(
                                              'Rewards',
                                              textAlign: TextAlign.center,
                                            ),
                                            content: ListView(
                                              children: (snapshot.data
                                                          .data()['reportCard']
                                                      as List)
                                                  .expand((exp) =>
                                                          (exp['rewards']
                                                                  as List)
                                                              .expand((e) {
                                                            print('eeeeee:$e');
                                                            return rewardList
                                                                .where(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        e)
                                                                .toList();
                                                          })

                                                      // rewardList.where((whe) =>
                                                      //     whe.id ==
                                                      //     exp['rewards'])
                                                      )
                                                  .map((e) => Neumorphic(
                                                        margin: const EdgeInsets
                                                            .all(5),
                                                        child: ListTile(
                                                          leading: Image.asset(
                                                              e.rewardImage),
                                                          title: Text(e.about),
                                                        ),
                                                      ))
                                                  .toList(),
                                            )));
                                  },
                                  myIcon: Image.asset('asset/medal.png'),
                                  myName: 'Rewards',
                                ),
                                // IconNameFunction(
                                //   myFunction: () {},
                                //   myIcon: Image.asset('asset/giftbox.png'),
                                //   myName: 'Gifts',
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // IconNameFunction(
                                //   myFunction: () {},
                                //   myIcon: Image.asset('asset/love.png'),
                                //   myName: 'Loved',
                                // ),
                                // IconNameFunction(
                                //   myFunction: () {},
                                //   myIcon: Image.asset('asset/like.png'),
                                //   myName: 'Liked',
                                // ),
                              ],
                            ),
                          ),
                          Chip(
                            label: NeumorphicText(
                              '${snapshot.data['reportCard'].length.toString()} Uploads',
                              textStyle: NeumorphicTextStyle(
                                  fontWeight: FontWeight.bold),
                              style: NeumorphicStyle(
                                  depth: 1,
                                  intensity: 1,
                                  surfaceIntensity: 1,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            snapshot.data
                                    .data()['username']
                                    .toString()
                                    .toUpperCase() ??
                                'Username',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                                snapshot.data.data()['bio'].toString() ??
                                    'My Bio'),
                          )
                        ],
                      )
                    : Lottie.asset('asset/cat_loader.json',
                        width: 100, height: 100),
              );
            }
            return Center(
                child: Lottie.asset('asset/cat_loader.json',
                    width: 100, height: 100));
          },
        ));
  }
}
