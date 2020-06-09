import 'package:flutter/material.dart';
import 'komponen.dart';

class BusSchedule extends StatefulWidget {
  @override
  _BusScheduleState createState() => _BusScheduleState();
}

class _BusScheduleState extends State<BusSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: new Center(child: new Text(
          'CARI BUS',
          style: txtappbar,
        ),)
      ),
    );
  }
}