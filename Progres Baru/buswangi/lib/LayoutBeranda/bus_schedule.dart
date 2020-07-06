import 'package:flutter/material.dart';
import '../Widget/komponen.dart';

class BusSchedule extends StatefulWidget {
  @override
  _BusScheduleState createState() => _BusScheduleState();
}

class _BusScheduleState extends State<BusSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.blueAccent,
          title: new Center(
            child: new Text(
              'CARI BUS',
              style: txtappbar,
            ),
          )),
    );
  }
}
