import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white70,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text('Main'),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    leading: Icon(
                      Icons.home_rounded,
                      color: Colors.pinkAccent,
                    ),
                    title: Text(
                      'Overview',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ),
                onTap: () {
                  if (Navigator.of(context).canPop())
                    Navigator.of(context).pop();
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Rate this app'),
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Help & Feedback'),
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share this app'),
                ),
                onTap: () async {},
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.download_rounded),
                  title: Text('More apps'),
                ),
                onTap: () async {
                  //baby
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.favorite_border_rounded),
                  title: Text('Donate'),
                ),
                onTap: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
