import 'package:flutter/material.dart';

class ReportCardModel {
  final String id;
  final String username;
  final String userImage;
  final int sperms;
  final String reason;
  final bool public;
  final DateTime datetime;
  int like;
  List comment;
  List share;
  ReportCardModel(
      {@required this.username,
      @required this.id,
      @required this.datetime,
      this.userImage,
      @required this.sperms,
      @required this.reason,
      @required this.public,
      this.like,
      this.share,
      this.comment});
}
