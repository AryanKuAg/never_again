import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_again/provider/loginLogic.dart';

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

  Future<void> updateUserInfo({String username, bio, File updatedImage}) async {
    print(
        'username:$username, bio:$bio, updatedImage:${updatedImage.toString()}');
    try {
      String url;
      if (updatedImage != null) {
        final ref = LoginLogic()
            .fbStorage
            .ref()
            .child('user_image')
            .child(LoginLogic().auth.currentUser.uid + '.jpg');
        await ref.putFile(updatedImage).onComplete;
        url = await ref.getDownloadURL();
      }

      await _fireStore.collection('users').doc(_auth.currentUser.uid).update({
        'username': username,
        'bio': bio,
      });

      if (updatedImage != null)
        await _fireStore
            .collection('users')
            .doc(_auth.currentUser.uid)
            .update({'userImageUrl': url});
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
