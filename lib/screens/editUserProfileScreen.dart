import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:never_again/provider/loginLogic.dart';
import 'package:never_again/provider/myUser.dart';
import 'package:never_again/screens/loginScreen/signupScreen.dart';
import 'package:never_again/widgets/neumorphicAppBar.dart';

class EditUserProfileScreen extends StatefulWidget {
  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final nameTextController = TextEditingController();
  final bioTextController = TextEditingController();
  File _pickedImage;

  void _pickImageCamera() async {
    final pickedImageFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 20);
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  void _pickImageGallery() async {
    final pickedImageFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 10);
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

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
    final mediaQuery = MediaQuery.of(context).size;
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
                      bio: bioTextController.text.trim(),
                      updatedImage: _pickedImage);
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
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                radius: mediaQuery.height * 0.08,
                child: Icon(Icons.camera_alt),
                backgroundImage:
                    _pickedImage != null ? FileImage(_pickedImage) : null,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          actions: [
                            IconButton(
                              icon: Icon(
                                Icons.camera_alt_rounded,
                              ),
                              onPressed: _pickImageCamera,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.folder,
                              ),
                              onPressed: _pickImageGallery,
                            )
                          ],
                          content: Text('Choose The Source'),
                        ));
              },
            ),
            SizedBox(
              height: 15,
            ),
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
                                navigator.pop();
                                navigator.pop();
                                Timer(Duration(seconds: 1), () {
                                  LoginLogic().auth.signOut();
                                  navigator.pushReplacement(MaterialPageRoute(
                                      builder: (ctx) => SignUpScreen()));
                                });
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
