import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:never_again/provider/myUser.dart';

class ReportCardWidget extends StatelessWidget {
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return StreamBuilder(
      stream:
          _fireStore.collection('users/${MyUser().uid}/reportCard').snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // RaisedButton(
            //     child: Text('Dabao na!!!'),
            //     onPressed: () {
            //       print(snapshot.data.documents[0]['sperms']);
            //     })
            ...snapshot.data.documents
                .map((e) => Container(
                      margin: EdgeInsets.all(8),
                      child: Neumorphic(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Image.asset('asset/aryan.jpg'),
                              ),
                              title: Text(
                                e['username'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Chip(
                                label: Text(DateFormat.yMMMMd('en_US')
                                    .format(
                                        (e['dateTime'] as Timestamp).toDate())
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
                                            fontSize: mediaQuery.height * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '=',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: mediaQuery.height * 0.04),
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
                                                width: mediaQuery.height * 0.04,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '${(e['sperms'] * 18.6 as double).toInt().toString()} TB',
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
                                                width: mediaQuery.height * 0.04,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '\$ ${(e['sperms'] * 1620.0 as double).toInt().toString()} ',
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
                            Chip(
                              label: Text(
                                'REASON: ${e['reason'].toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: NeumorphicButton(
                                        child: Text(
                                          'Like',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {},
                                      ),
                                      margin: EdgeInsets.all(5),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: NeumorphicButton(
                                        child: Text(
                                          'Comment',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: NeumorphicButton(
                                        child: Text(
                                          'Share',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList()
          ],
        );
      },
    );
  }
}
