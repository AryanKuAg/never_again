import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerOfHomePage extends StatefulWidget {
  @override
  _TimerOfHomePageState createState() => _TimerOfHomePageState();
}

class _TimerOfHomePageState extends State<TimerOfHomePage> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
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
      label: Text(_timeString,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50 * textScaleFactor)),
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