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
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [
  //           Colors.blue,
  //           Colors.blueGrey
  //         ],
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter
  //       ),
  //     ),
  //     child: ListView(
  //       children: <Widget>[
  //         headerSection(),
  //         textSection(),
  //         buttonSection(),
  //       ],
  //     ),
  //   );
  // }

  // sing(String email, password) async {
  //   Map data = {'email': email, 'password': password};
  //   var jsonData = null;
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var response = await http.post("http://1223333", body: data);
  //   if (response.statusCode == 200) {
  //     jsonData = json.decode(response.body);
  //     setState(() {
  //       _isLoading:
  //       false;
  //       sharedPreferences.setString("token", jsonData['token']);
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (BuildContext context) => Beranda()),
  //           (Route<dynamic> route) => false);
  //     });
  //   } else {
  //     print(response.body);
  //   }
  // }

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
        sharedPreferences.setString("api_token", jsonResponse['api_token']);
        print("Shared Success=> $jsonResponse");
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
  // Container buttonSection(){
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 40.0,
  //     margin: EdgeInsets.only(top: 30.0),
  //     padding: EdgeInsets.symmetric(horizontal: 20.0),
  //     child: RaisedButton(
  //       onPressed: (){
  //         setState(() {
  //           _isLoading = true;
  //         });
  //         singIn(emailControler.text, passwordControler.text);
  //       },
  //       color: Colors.purple,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular (5.0),
  //       ),
  //       child: Text("Sing In", style: TextStyle(color: Colors.white70)),
  //     ),
  //   );
  // }
  
  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();

  // Container textSection() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20.0),
  //     margin: EdgeInsets.only(top: 30.0),
  //     child: Column(
  //       children: <Widget>[
  //         txtEmail("Email", Icons.email),
  //         SizedBox(height: 30.0),
  //         txtPassword("Password", Icons.lock),
  //       ],
  //     ),
  //   );
  // }

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

//  TextFormField txtEmail(String title, IconData icon) {
//     return TextFormField(
//       controller: emailControler,
//       // obscureText: title == "Email" ? false : true,
//       style: TextStyle(color: Colors.white70),
//       decoration: InputDecoration(
//           hintText: title,
//           hintStyle: TextStyle(color: Colors.white70),
//           icon: Icon(icon)),
//     );
//   }

  // TextFormField txtPassword(String title, IconData icon) {
  //   return TextFormField(
  //     controller: passwordControler,
  //     obscureText: true,
  //     // obscureText: title == "Email" ? false : true,
  //     style: TextStyle(color: Colors.white70),
  //     decoration: InputDecoration(
  //         hintText: title,
  //         hintStyle: TextStyle(color: Colors.white70),
  //         icon: Icon(icon)),
  //   );
  // }

  // Container headerSection() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
  //     child: Text("Code Land", style: TextStyle(fontSize: 14.0, fontFamily: 'OpenSans', color: Color(0xFF527DAA)),),
  //   );
  // }


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
}}