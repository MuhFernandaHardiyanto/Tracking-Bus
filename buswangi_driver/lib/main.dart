import 'package:buswangi_driver/beranda.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buswangi Driver',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Beranda(),
      // home: MyHomePage(title: 'Buswangi'),
    );
  }
}