import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text(
          "Account",
           style: new TextStyle(color: Colors.blueGrey[50], fontWeight: FontWeight.bold, 
           fontSize: 15.0, fontFamily: 'OpenSans' )
        )
      ),
    );
  }
}

// class Akun extends StatelessWidget {
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