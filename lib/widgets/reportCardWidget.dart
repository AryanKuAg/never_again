import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/reportCardLogic.dart';
import 'package:provider/provider.dart';

class ReportCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final reportCardLogic = Provider.of<ReportCardLogic>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...reportCardLogic.reportCardList
            .map((e) => Container(
                  margin: EdgeInsets.all(8),
                  child: Neumorphic(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: e.userImage,
                          ),
                          title: Text(
                            e.username.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Chip(
                            label: Text(e.datetime.toString().substring(0, 10)),
                          ),
                          subtitle: Text(e.sperms.toString()),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Image.asset(
                                  'asset/moresperm.png',
                                  width: mediaQuery.height * 0.04,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${e.sperms.toString()} ml',
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
                                          '${(e.sperms * 18.6 as double).toInt().toString()} TB',
                                          style: TextStyle(
                                              fontSize:
                                                  mediaQuery.height * 0.04,
                                              fontWeight: FontWeight.bold),
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
                                          '\$ ${(e.sperms * 1620.0 as double).toInt().toString()} ',
                                          style: TextStyle(
                                              fontSize:
                                                  mediaQuery.height * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text('hey'),
                          title: Text('hey'),
                          trailing: Text('hey'),
                        )
                      ],
                    ),
                  ),
                ))
            .toList()
      ],
    );
  }
}
