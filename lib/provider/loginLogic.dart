import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:never_again/provider/rewardsList.dart';
import 'package:never_again/tabbar.dart';

class LoginLogic with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final fbStorage = FirebaseStorage.instance;
  static void loginAnonymously(
      {String username,
      int age,
      bool isMale,
      BuildContext ctx,
      File myImageFile}) async {
    try {
      final userSignIn = await LoginLogic().auth.signInAnonymously();
      //according to rule of firebase storage, if user is not authenticated then he/she can't upload their pics.
      //that's why i first signinanonymously user then i upload file. i hope that work
      final ref = LoginLogic()
          .fbStorage
          .ref()
          .child('user_image')
          .child(LoginLogic().auth.currentUser.uid + '.jpg');
      await ref.putFile(myImageFile).onComplete;
      final url = await ref.getDownloadURL();

      await LoginLogic()
          .fireStore
          .collection('users')
          .doc(userSignIn.user.uid)
          .set({
        'username': username,
        'age': age,
        'isMale': isMale,
        'reportCard': [],
        'bio': 'My Bio',
        'masturbation': true,
        'userImageUrl': url
      });
      if (userSignIn.user != null) {
        Navigator.of(ctx)
            .pushReplacement(MaterialPageRoute(builder: (ctxx) => MyTabBar()));
      }
    } catch (e) {
      print(e);
    }
  }

  Stream<User> get getAuthState {
    notifyListeners();
    return auth.authStateChanges();
  }
}
