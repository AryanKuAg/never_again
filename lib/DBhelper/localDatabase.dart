import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart' as sql;
// import 'package:path/path.dart' as path;

class LocalDatabase with ChangeNotifier {
  DateTime myDateTime = DateTime.now();

  // static Future<void> insert() async{
  //   final dbPath = await sql.getDatabasesPath();
  //   sql.openDatabase(path.join(dbPath,'rewards.db'),onCreate: (db, version){
  //     return db.execute('CREATE TABLE kfjsl;fjkslfj;aslfjfsjfljfsf;')
  //   });
  // }
}
