import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginLogic {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  static void loginAnonymously({String username, int age, bool isMale}) async {
    final userSignIn = await LoginLogic().auth.signInAnonymously();
    final userLogged = await LoginLogic()
        .fireStore
        .collection('users')
        .doc(userSignIn.user.uid)
        .set({
      'username': username,
      'age': age,
      'isMale': isMale,
      'bio': 'My Bio'
    });
  }
}
