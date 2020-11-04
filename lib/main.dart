import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:never_again/DBhelper/localDatabase.dart';
import 'package:never_again/provider/chatDataLogic.dart';
import 'package:never_again/provider/loginLogic.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/provider/reportCardLogic.dart';
import 'package:never_again/tabbar.dart';
import 'package:splashscreen/splashscreen.dart';
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
        ChangeNotifierProvider(
          create: (ctx) => ChatDataLogic(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LocalDatabase(),
        ),
      ],
      child: NeumorphicApp(
          title: 'Never Again',
          debugShowCheckedModeBanner: false,
          theme: NeumorphicThemeData(
              textTheme: GoogleFonts.bubblegumSansTextTheme()),
          home: SplashScreen(
            seconds: 3,
            navigateAfterSeconds: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Lottie.asset('asset/cat_loader.json');
                }
                if (snapshot.hasData) {
                  return MyTabBar();
                } else {
                  return SignUpScreen();
                }
              },
            ),
            title: const Text(
              'Never Again',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            image: Image.asset('asset/splashIcon.png'),
            backgroundColor: Colors.white,
            photoSize: 150,
            loaderColor: Colors.amberAccent,
            loadingText: Text('Getting App Ready!'),
          )),
    );
  }
}

// FirebaseAuth.instance.currentUser != null
// ? MyTabBar()
// : SignUpScreen()
