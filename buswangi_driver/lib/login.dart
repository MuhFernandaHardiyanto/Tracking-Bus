import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'register.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool ingatsaya = false;
  bool _isLoading = false;
  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();

  Widget txtmasuk(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: label,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: dekorasiKotak,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Masukkan email kamu',
              hintStyle: kotaktext,
            ),
          ),
        )
      ],
    );
  }

  Widget kataSandi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Kata Sandi',
          style: label,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: dekorasiKotak,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Masukkan Kata Sandi Kamu',
              hintStyle: kotaktext,
            ),
          ),
        ),
      ],
    );
  }

  Widget lupaKataSandi() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('berhasil'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Lupa Kata Sandi?',
          style: label,
        ),
      ),
    );
  }

  // Widget boxingatsaya() {
  //   return Container(
  //     height: 20.0,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: ingatsaya,
  //             checkColor: Colors.red,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 ingatsaya = value;
  //               });
  //             },
  //           ),
  //         ),
  //         Text(
  //           'Ingat Saya',
  //           style: label,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget btnMasuk() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: emailControler.text == "" || passwordControler.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailControler.text, passwordControler.text);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Masuk',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget daftarakun() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new Register(),
      )),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Belum memiliki akun?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Daftar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
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

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/img/logo.png",
                          width: 120.0,
                        ),
                        SizedBox(height: 20.0),
                        txtmasuk(),
                        SizedBox(
                          height: 10.0,
                        ),
                        email(),
                        SizedBox(
                          height: 10.0,
                        ),
                        kataSandi(),
                        lupaKataSandi(),
                        // boxingatsaya(),
                        btnMasuk(),
                        daftarakun(),

                      ],
                    ),
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
