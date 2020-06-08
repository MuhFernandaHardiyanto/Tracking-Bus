import 'package:buswangi/login.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buswangi',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      // home: MyHomePage(title: 'Buswangi'),
    );
  }
}