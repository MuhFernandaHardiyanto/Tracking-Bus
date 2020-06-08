import 'package:buswangi/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());
void main(){
  SharedPreferences.setMockInitialValues({});
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