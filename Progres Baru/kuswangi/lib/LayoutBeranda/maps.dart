import 'package:flutter/material.dart';
import '../Widget/komponen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        title: new Center(child: new Text(
          'MAPS BUS BANYUWANGI',
          style: txtappbar,
        ),)
      ),
    );
  }
}