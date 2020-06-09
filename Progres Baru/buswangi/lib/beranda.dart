import 'package:buswangi/login.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import './maps.dart' as maps;
import './profile.dart' as profile;
import './bus_schedule.dart' as bus_schedule;


class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin{

 SharedPreferences sharedPreferences;
 TabController controller;

  @override
  void initState() {
    controller =
        new TabController(vsync: this, length: 3);
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("api_token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>   Login()), (Route<dynamic> route) => false);
    }
  }
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new maps.Maps(),
          new bus_schedule.BusSchedule(),
          new profile.Profile()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.indigo[900],
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

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Code Land", style: TextStyle(color: Colors.white)),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: () {
//               sharedPreferences.clear();
              
//               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (Route<dynamic> route) => false);
//             },
//             child: Text("Log Out", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Center(child: Text("Main Page")),
//       drawer: Drawer(),
//     );
//   }
// }