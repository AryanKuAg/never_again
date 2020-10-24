import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfHomePage extends StatefulWidget {
  @override
  _DateOfHomePageState createState() => _DateOfHomePageState();
}

class _DateOfHomePageState extends State<DateOfHomePage> {
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
    return Container(
        child: Text(
      _timeString,
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
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}
