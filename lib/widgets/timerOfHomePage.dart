import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:never_again/DBhelper/localDatabase.dart';
import 'package:provider/provider.dart';

class TimerOfHomePage extends StatefulWidget {
  @override
  _TimerOfHomePageState createState() => _TimerOfHomePageState();
}

class _TimerOfHomePageState extends State<TimerOfHomePage> {
  String _timeString;
  DateTime _myDateTime;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _myDateTime = Provider.of<LocalDatabase>(context).myDateTime;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
        child: Chip(
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                  '${DateTime.now().difference(_myDateTime).inDays.remainder(60)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50 * textScaleFactor)),
              Text('DAYS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * textScaleFactor)),
            ],
          ),
          Text(':',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 50 * textScaleFactor)),
          Column(
            children: [
              Text(
                  '${DateTime.now().difference(_myDateTime).inHours.remainder(60)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50 * textScaleFactor)),
              Text('HOURS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * textScaleFactor)),
            ],
          ),
          Text(':',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 50 * textScaleFactor)),
          Column(
            children: [
              Text(
                  '${DateTime.now().difference(_myDateTime).inMinutes.remainder(60)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50 * textScaleFactor)),
              Text('MINS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * textScaleFactor)),
            ],
          ),
          Text(':',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 50 * textScaleFactor)),
          Column(
            children: [
              Text(
                  '${DateTime.now().difference(_myDateTime).inSeconds.remainder(60)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50 * textScaleFactor)),
              Text('SECS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * textScaleFactor)),
            ],
          )
        ],
      ),
    ));
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if (!mounted) return;
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
