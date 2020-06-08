import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text(
          "Maps Bus Banyuwangi",
           style: new TextStyle(color: Colors.blueGrey[50], fontWeight: FontWeight.bold, 
           fontSize: 15.0, fontFamily: 'OpenSans' )
        )
      ),
      body: new Padding(padding: new EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        new Text('data')
      ] ),
    )
    );
  }
}


// class Maps extends StatelessWidget {
//    @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.blue[300],
  //       title: new Text(
  //         "MAPS BUS BANYUWANGI",
  //         style: new TextStyle(color: Colors.blueGrey[50], fontWeight: FontWeight.bold, 
  //         fontSize: 15.0, fontFamily: 'OpenSans' ),)
          
  
  //     ),
  //     body: new Padding(padding: new EdgeInsets.all(20.0),
  //     child : Column(children: <Widget>[
  //     new Text("AKUN ON PROSES" , style: new TextStyle(fontSize: 20.0, 
  //     color: Colors.black38, fontWeight: FontWeight.bold),)

  //     ],),),),
      
  // }}