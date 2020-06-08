import 'package:buswangi/beranda.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  @override
    Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            logo(),
            // headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password
    };
    var jsonResponse;
    var response = await http.post("http://192.168.43.94:8000/login", body: data);
    print(response.statusCode);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        // sharedPreferences.setString("RHFnamF5VWYydVI2QzVkbTZyTUdYR1lMUnRqRDhDQTJTbkVVN2tIMQ==", jsonResponse['RHFnamF5VWYydVI2QzVkbTZyTUdYR1lMUnRqRDhDQTJTbkVVN2tIMQ==']);
        sharedPreferences.setString("api_token", jsonResponse["data"]["api_token"]);
        print(json.encode(jsonResponse["data"]["api_token"]));
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Beranda()), (Route<dynamic> route) => false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Beranda()));
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();

     Container logo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
                  Image.asset(
                  "assets/img/logo.png",
                   width: 120.0,),
        ]
      ),
    );
    }
    
    Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailControler,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordControler,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }


  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: emailControler.text == "" || passwordControler.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailControler.text, passwordControler.text);
        },
        elevation: 0.0,
        color: Color(0xFF527DAA),
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
 }