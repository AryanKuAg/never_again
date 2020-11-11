import 'package:flutter/material.dart';

class ReportCardModel {
  final String id;
  final String username;
  final String userImage;
  final int sperms;
  final String reason;
  final bool public;
  final DateTime datetime;
  final String controlDuration;
  final List rewards;
  int like;
  List comment;
  List share;
  ReportCardModel(
      {@required this.username,
      @required this.id,
      this.controlDuration,
      this.rewards,
      @required this.datetime,
      this.userImage,
      @required this.sperms,
      @required this.reason,
      @required this.public,
      this.like,
      this.share,
      this.comment});
}
