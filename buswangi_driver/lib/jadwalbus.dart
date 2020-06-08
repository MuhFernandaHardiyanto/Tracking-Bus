import 'package:flutter/material.dart';

class JadwalBus extends StatefulWidget {
  @override
  _JadwalBusState createState() => _JadwalBusState();
}

class _JadwalBusState extends State<JadwalBus> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text(
          "Jadwal Bus Banyuwangi",
           style: new TextStyle(color: Colors.blueGrey[50], fontWeight: FontWeight.bold, 
           fontSize: 15.0, fontFamily: 'OpenSans' )
        )
      ),
      
    );
  }
}


// class JadwalBus extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       child: new Center(
//         child: new Column(
//           children: <Widget>[
//             new Padding(padding: new EdgeInsets.all(20.0),),
//             // new Icon(Icons.save, size: 90.0,),
//             // new Image(image: new NetworkImage("https://talkinnow.com/wp-content/uploads/2018/02/WhatsApp-Life-Status.jpg"),width: 500.0,),
//             new Padding(padding: new EdgeInsets.all(20.0),),
//             new Text("AKUN ON PROSES" , style: new TextStyle(fontSize: 20.0, color: Colors.black38, fontWeight: FontWeight.bold),)
//           ],
//         ),
//       ),
//     );
//   }
// }