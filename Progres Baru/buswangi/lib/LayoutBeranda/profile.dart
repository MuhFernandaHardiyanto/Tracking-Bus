import 'package:flutter/material.dart';
import '../Widget/komponen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Center(
            child: new Text(
              'PROFILE AKUN',
              style: txtappbar,
            ),
          )),
    );
  }
}
