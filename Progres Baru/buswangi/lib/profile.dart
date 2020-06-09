import 'package:flutter/material.dart';
import 'komponen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: new Center(child: new Text(
          'PROFILE AKUN',
          style: txtappbar,
        ),)
      ),
    );
  }
}