import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/loginLogic.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/provider/reportCardLogic.dart';
import 'package:never_again/tabbar.dart';
import './screens/loginScreen/signupScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ReportCardLogic(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyUser(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LoginLogic(),
        ),
      ],
      child: NeumorphicApp(
          title: 'Never Again',
          debugShowCheckedModeBanner: false,
          home: FirebaseAuth.instance.currentUser != null
              ? MyTabBar()
              : SignUpScreen()),
    );
  }
}

// StreamBuilder(
// stream: FirebaseAuth.instance.authStateChanges(),
// builder: (ctx, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return CircularProgressIndicator();
// }
// if (snapshot.hasData) {
// return MyTabBar();
// } else {
// return SignUpScreen();
// }
// },
// )
