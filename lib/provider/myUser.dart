import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyUser with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  String get uid {
    return _auth.currentUser.uid.toString();
  }

  Future<String> get getUsername async {
    final userInfoDoc =
        await _fireStore.collection('users').doc(_auth.currentUser.uid).get();
    return userInfoDoc['username'];
  }

  Future<String> get getBio async {
    final userInfoDoc =
        await _fireStore.collection('users').doc(_auth.currentUser.uid).get();
    return userInfoDoc['bio'];
  }

  Future<int> get getTotalUploads async {
    final doc = await _fireStore
        .collection('users/${_auth.currentUser.uid}/reportCard')
        .get();
    return doc.size;
  }

  Future<void> updateUserInfo({String username, bio}) async {
    try {
      await _fireStore
          .collection('users')
          .doc(_auth.currentUser.uid)
          .update({'username': username, 'bio': bio});
    } catch (e) {
      print(e);
    }
  }

  Future<String> get userImageUrl async {
    try {
      final _data =
          await _fireStore.collection('users').doc(_auth.currentUser.uid).get();
      return _data.data()['userImageUrl'];
    } catch (e) {
      print(e);
    }
  }
}
