import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8c52ff),
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              Image.asset('assets/splash-image.png', fit: BoxFit.contain, height: 40),
              Padding(padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0)),
              Text('User Profile')
            ],
          )
      ),
      body: Text('Profile Section'),
    );
  }
}
