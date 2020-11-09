import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:never_again/models/reportCardModel.dart';
import 'package:never_again/provider/chatDataLogic.dart';
import 'package:never_again/screens/chatStoreScreen.dart';
import 'package:never_again/widgets/myDrawer.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          future: ChatDataLogic().getAllReportCard(ctx: context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Lottie.asset('asset/cat_loader.json',
                      width: 100, height: 100));
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: snapshot.data != null
                  ? Column(
                      children: [
                        ...(snapshot.data as List<ReportCardModel>)
                            .map((e) => Container(
                                  margin: EdgeInsets.all(8),
                                  child: Neumorphic(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: e.userImage != null
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
                                                        fontSize:
                                                            mediaQuery.height *
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
                                                        fontSize:
                                                            mediaQuery.height *
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
                                                                fontSize: mediaQuery
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
                                                                fontSize: mediaQuery
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
                                        Chip(
                                          label: Text(
                                            'REASON: ${e.reason.toString()}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.all(8),
                                        //   child: Row(
                                        //     mainAxisSize: MainAxisSize.max,
                                        //     children: [
                                        //       Expanded(
                                        //         child: Container(
                                        //           child: NeumorphicButton(
                                        //             child: Text(
                                        //               'Like',
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             ),
                                        //             onPressed: () {},
                                        //           ),
                                        //           margin: EdgeInsets.all(5),
                                        //         ),
                                        //       ),
                                        //       Expanded(
                                        //         child: Container(
                                        //           margin: EdgeInsets.all(5),
                                        //           child: NeumorphicButton(
                                        //             child: Text(
                                        //               'Comment',
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             ),
                                        //             onPressed: () {
                                        //               showModalBottomSheet(
                                        //                   context: context,
                                        //                   backgroundColor:
                                        //                       Colors.white70
                                        //                           .withOpacity(
                                        //                               0),
                                        //                   builder: (ctx) =>
                                        //                       Container(
                                        //                         decoration: BoxDecoration(
                                        //                             color: Colors
                                        //                                 .white,
                                        //                             borderRadius:
                                        //                                 BorderRadius.vertical(
                                        //                                     top:
                                        //                                         Radius.circular(20))),
                                        //                         child: Column(
                                        //                           mainAxisSize:
                                        //                               MainAxisSize
                                        //                                   .min,
                                        //                           children: [
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Text('hey'),
                                        //                             Spacer(),
                                        //                             TextField()
                                        //                           ],
                                        //                         ),
                                        //                       ));
                                        //             },
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Expanded(
                                        //         child: Container(
                                        //           margin: EdgeInsets.all(5),
                                        //           child: NeumorphicButton(
                                        //             child: Text(
                                        //               'Save',
                                        //               style: TextStyle(
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //               textAlign:
                                        //                   TextAlign.center,
                                        //             ),
                                        //             onPressed: () {},
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        if (false)
                                          Neumorphic(
                                            margin: EdgeInsets.all(10),
                                            style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave),
                                          )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                      ],
                    )
                  : Lottie.asset('asset/lonely_404.json'),
            );
          },
        ));
  }
}
