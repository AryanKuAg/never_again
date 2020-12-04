import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:never_again/models/reportCardModel.dart';
import 'package:never_again/provider/chatDataLogic.dart';
import 'package:never_again/provider/rewardsList.dart';
import 'package:never_again/widgets/advertisementData.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStore = FirebaseFirestore.instance;
  var subscription;
  BannerAd _bannerAd;

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3739926644625425~6646484032');
    _bannerAd = AdvertisementData().createBannerAd()
      ..load()
      ..show(anchorType: AnchorType.top, anchorOffset: 105.0);
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ChatDataLogic().getAllReportCard(ctx: context);
    super.didChangeDependencies();
  }

  Future<void> refreshCards(BuildContext context) async {
    await Provider.of<ChatDataLogic>(context).getAllReportCard(ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        drawer: MyDrawer(),
        appBar: CustomNeumorphicAppBar(
            ctx: context,
            titleText: 'Chat',
            myWidgetList: [
              // NeumorphicButton(
              //               //   child: Icon(Icons.add_shopping_cart_rounded),
              //               //   onPressed: () {
              //               //     Navigator.of(context).push(
              //               //         MaterialPageRoute(builder: (ctx) => ChatStoreScreen()));
              //               //   },
              //               // ),
            ]),
        body: FutureBuilder(
          future: _fireStore.collection('users').limit(10).get(),
          // ChatDataLogic().getAllReportCard(ctx: context)
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Timer(Duration(seconds: 5), () {
                return Center(
                    child: Lottie.asset('asset/lonely_404.json',
                        width: 100, height: 100));
              });
              return Center(
                  child: Lottie.asset('asset/cat_loader.json',
                      width: 100, height: 100));
            }

            List allReportCards = (snapshot.data.docs
                    .expand((element) => element.data()['reportCard'] as List)
                    .toList() as List)
                .where((element) => element['public'] == true)
                .map((e) => ReportCardModel(
                    username: e['username'].toString(),
                    // id: element.id,
                    datetime: (e['dateTime'] as Timestamp).toDate(),
                    sperms: e['sperms'],
                    controlDuration: e['controlDuration'],
                    rewards: e['rewards'],
                    reason: e['reason'].toString(),
                    public: e['public'],
                    userImage: e['userImageUrl']))
                .toList();
            allReportCards.shuffle();

            return RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: snapshot.data != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          ...(allReportCards as List<ReportCardModel>)
                              .map((e) => Container(
                                    margin: EdgeInsets.all(8),
                                    child: Neumorphic(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: e.userImage !=
                                                      null
                                                  ? NetworkImage(e.userImage)
                                                  : null,
                                            ),
                                            title: Text(
                                              e.username,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              e.public
                                                  ? '🌍 PUBLIC'
                                                  : '🔒 PRIVATE',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: Chip(
                                              label: Text(
                                                  DateFormat.yMMMMd('en_US')
                                                      .format(e.datetime)
                                                      .toString()),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Chip(
                                                label: Row(
                                                  children: [
                                                    Image.asset(
                                                      'asset/moresperm.png',
                                                      width: mediaQuery.height *
                                                          0.04,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '${e.sperms.toString()} ml',
                                                      style: TextStyle(
                                                          fontSize: mediaQuery
                                                                  .height *
                                                              0.04,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '=',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: mediaQuery
                                                                  .height *
                                                              0.04),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Image.asset(
                                                              'asset/ssd.png',
                                                              width: mediaQuery
                                                                      .height *
                                                                  0.04,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              '${(e.sperms * 11.2).toInt().toString()}PB DNA',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      mediaQuery
                                                                              .height *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Image.asset(
                                                              'asset/dollar.png',
                                                              width: mediaQuery
                                                                      .height *
                                                                  0.04,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              '\$ ${(e.sperms * 1.12).toInt().toString()}M',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      mediaQuery
                                                                              .height *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Chip(
                                                label: Row(children: [
                                                  ...e.rewards.expand((emo) {
                                                    return rewardList
                                                        .where((element) =>
                                                            element.id == emo)
                                                        .map((eyo) => Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              child:
                                                                  Image.asset(
                                                                eyo.rewardImage,
                                                                height: 50,
                                                                width: 50,
                                                              ),
                                                            ));
                                                  }).toList()
                                                ]),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Chip(
                                                label: Text(
                                                  'REASON: ${e.reason.toString()}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Chip(
                                                label: Text(
                                                  '${e.controlDuration?.substring(0, e.controlDuration?.indexOf(':'))} Hours',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()
                        ],
                      )
                    : Lottie.asset('asset/lonely_404.json'),
              ),
            );
          },
        ));
  }
}
