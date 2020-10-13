import 'package:flutter/material.dart';

class ReportCardModel {
  final String username;
  final Image userImage;
  final int sperms;
  final String reason;
  int like;
  List comment;
  List share;
  ReportCardModel(
      {@required this.username,
      @required this.userImage,
      @required this.sperms,
      @required this.reason,
      this.like,
      this.share,
      this.comment});
}
