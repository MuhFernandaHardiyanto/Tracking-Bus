import 'package:flutter/material.dart';

class DetailBus extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            // new Icon(Icons.save, size: 90.0,),
            // new Image(image: new NetworkImage("https://talkinnow.com/wp-content/uploads/2018/02/WhatsApp-Life-Status.jpg"),width: 500.0,),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("DETAIL ON PROSES" , style: new TextStyle(fontSize: 20.0, color: Colors.black38, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}