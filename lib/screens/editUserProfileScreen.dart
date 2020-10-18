import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:never_again/provider/loginLogic.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class EditUserProfileScreen extends StatefulWidget {
  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final nameTextController = TextEditingController();
  final bioTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    MyUser().getUsername.then((value) => nameTextController.text = value);
    MyUser().getBio.then((value) => bioTextController.text = value);
  }

  @override
  void dispose() {
    nameTextController.dispose();
    bioTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: CustomNeumorphicAppBar(
          ctx: context,
          titleText: 'Edit',
          myWidgetList: [
            NeumorphicButton(
              child: Icon(Icons.check),
              onPressed: () {
                if (nameTextController.text.length > 2 &&
                    bioTextController.text.length > 2)
                  MyUser().updateUserInfo(
                      username: nameTextController.text.trim(),
                      bio: bioTextController.text.trim());
                navigator.pop();
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Neumorphic(
              child: TextField(
                controller: nameTextController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              child: TextField(
                controller: bioTextController,
                decoration: InputDecoration(
                  icon: Icon(Icons.short_text),
                  border: InputBorder.none,
                  hintText: 'Bio',
                ),
              ),
            ),
            Spacer(),
            NeumorphicButton(
              child: Text(
                'Log out',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          content:
                              Text('Are You Sure? We Don\'t Want To Lose U 😥'),
                          actions: [
                            FlatButton(
                              child: Text('Leave'),
                              onPressed: () {
                                LoginLogic().auth.signOut();
                                if (navigator.canPop()) navigator.pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Stay'),
                              onPressed: () {
                                navigator.pop();
                              },
                            )
                          ],
                        ));
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
