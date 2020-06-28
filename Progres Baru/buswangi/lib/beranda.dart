import 'dart:ui';
import 'package:buswangi/login.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'LayoutBeranda/maps.dart';
import 'LayoutBeranda/profile.dart';
import 'LayoutBeranda/bus_schedule.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin{

//  SharedPreferences sharedPreferences;
    int pageIndex = 0;

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if(sharedPreferences.getString("api_token") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>   Login()), (Route<dynamic> route) => false);
  //   }
  // }  

  final Maps _maps = Maps();
  final BusSchedule _busSchedule = BusSchedule();
  final Profile _profile = Profile();

  Widget _showPage = new Maps();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return _maps;
      case 1:
      return _busSchedule;
      case 2:
      return _profile;
      break;
      default:
      return new Container(
        child: new Center(
          child: new Text('No Page Found', style: new TextStyle(fontSize: 30.0),),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index : pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.location_on, size: 30, color: Colors.red[900]),
            Icon(Icons.departure_board, size: 30, color: Colors.purple[900],),
            Icon(Icons.face, size: 30, color: Colors.green[600]),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}