import 'package:flutter/material.dart';
import './maps.dart' as maps;
import './jadwalbus.dart' as jadwalbus;
import './akun.dart' as akun;

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller =
        new TabController(vsync: this, length: 3); //lenght adalah banyaknya tab
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[300],
      //   title: new Text(
      //     "BUSWANGI",
      //     style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
      //   ),
        // bottom: new TabBar(
        //   controller: controller,
        //   tabs: <Widget>[
        //     new Tab(
        //       icon: new Icon(Icons.map),
        //     ),
        //     new Tab(
        //       icon: new Icon(Icons.details),
        //     ),
        //     new Tab(
        //       icon: new Icon(Icons.notifications),
        //     ),
        //     new Tab(
        //       icon: new Icon(Icons.account_circle),
        //     ),
        //   ],
        // ),
      
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new maps.Maps(),
          new jadwalbus.JadwalBus(),
          new akun.Akun()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue[300],
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.location_on),
            ),
            new Tab(
              icon: new Icon(Icons.departure_board),
            ),
            new Tab(
              icon: new Icon(Icons.face),
            ),
          ],
        ),
      ),
    );
  }
}
