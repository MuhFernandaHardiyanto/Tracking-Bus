import 'package:flutter/material.dart';
import 'komponen.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: new Center(child: new Text(
          'MAPS BUS BANYUWANGI',
          style: txtappbar,
        ),)
      ),
    );
  }
}