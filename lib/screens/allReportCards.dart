import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/provider/rewardsList.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class AllReportCards extends StatefulWidget {
  @override
  _AllReportCardsState createState() => _AllReportCardsState();
}

class _AllReportCardsState extends State<AllReportCards> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomNeumorphicAppBar(
        ctx: context,
        titleText: 'ReportCards',
      ),
      body: StreamBuilder(
        stream: _fireStore
            .collection('users')
            .doc(_auth.currentUser.uid)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('asset/cat_loader.json',
                  width: 100, height: 100),
            );
          }

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...(snapshot.data['reportCard'] as List)
                    .reversed
                    .map((e) => Container(
                          margin: EdgeInsets.all(8),
                          child: Neumorphic(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: e['userImageUrl'] != null
                                        ? NetworkImage(
                                            e['userImageUrl'].toString())
                                        : null,
                                  ),
                                  title: Text(
                                    e['username'].toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    e['public'] ? '🌍 PUBLIC' : '🔒 PRIVATE',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Chip(
                                    label: Text(DateFormat.yMMMMd('en_US')
                                        .format((e['dateTime'] as Timestamp)
                                            .toDate())
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
                                            width: mediaQuery.height * 0.04,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${e['sperms'].toString()} ml',
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.height * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '=',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    mediaQuery.height * 0.04),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'asset/ssd.png',
                                                    width: mediaQuery.height *
                                                        0.04,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${(e['sperms'] * 11.2 as double).toInt().toString()}PB DNA',
                                                    style: TextStyle(
                                                        fontSize:
                                                            mediaQuery.height *
                                                                0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'asset/dollar.png',
                                                    width: mediaQuery.height *
                                                        0.04,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '\$ ${(e['sperms'] * 1.12 as double).toInt().toString()}M',
                                                    style: TextStyle(
                                                        fontSize:
                                                            mediaQuery.height *
                                                                0.04,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                        ...(e['rewards'] as List<dynamic>)
                                            .expand((emo) {
                                          return rewardList
                                              .where((element) =>
                                                  element.id == emo)
                                              .map((eyo) => Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Image.asset(
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
                                        'REASON: ${e['reason'].toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Chip(
                                      label: Text(
                                        '${(e['controlDuration'] as String)?.substring(0, e['controlDuration']?.indexOf(':'))} Hours',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
            ),
          );
        },
      ),
    );
  }
}
