import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:never_again/tabbar.dart';

class LoginLogic with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  static void loginAnonymously(
      {String username, int age, bool isMale, BuildContext ctx}) async {
    try {
      final userSignIn = await LoginLogic().auth.signInAnonymously();
      await LoginLogic()
          .fireStore
          .collection('users')
          .doc(userSignIn.user.uid)
          .set({
        'username': username,
        'age': age,
        'isMale': isMale,
        'bio': 'My Bio',
        'masturbation': true
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
