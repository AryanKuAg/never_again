import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/reportCardLogic.dart';
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
    return ChangeNotifierProvider(
      create: (ctx) => ReportCardLogic(),
      child: NeumorphicApp(
          title: 'Never Again',
          debugShowCheckedModeBanner: false,
          home: SignUpScreen()),
    );
  }
}
