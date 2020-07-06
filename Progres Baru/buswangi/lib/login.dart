import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Widget/komponen.dart';
import 'register.dart';
import 'beranda.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool _isLoading = true;
  // bool ingatsaya = false;
  SharedPreferences sharedPreferences;
  bool _secureText = true;
  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // @override
  // void initState() {
  //  signIned();
  //   super.initState();
  // }

  // signIned() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if(sharedPreferences.getString("api_token") == null) {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Login()));
  //   }else{
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Beranda()));
  //   }
  // }

  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();

  Widget txtmasuk() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Login',
          style: judul,
        ),
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
            controller: emailControler,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Masukkan email',
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
            controller: passwordControler,
            obscureText: _secureText,
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
              suffixIcon: IconButton(
                icon:
                    Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                color: Colors.white,
                onPressed: () {
                  showhide();
                },
              ),
              hintText: 'Masukkan Kata Sandi',
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

  Widget btnMasuk() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            // _isLoading = true;
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

  Future<void> _dialogLoginGagal() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            content: new Text(
              "Email dan Password Anda Salah, Silahkan Coba Kembali",
              style: new TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              new RaisedButton(
                  color: Colors.white70,
                  child: new Text("oke"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      },
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
        // setState(() {
        //   _isLoading = false;
        // });
        // sharedPreferences.setString("RHFnamF5VWYydVI2QzVkbTZyTUdYR1lMUnRqRDhDQTJTbkVVN2tIMQ==", jsonResponse['RHFnamF5VWYydVI2QzVkbTZyTUdYR1lMUnRqRDhDQTJTbkVVN2tIMQ==']);
        sharedPreferences.setString("api_token", jsonResponse["data"]["api_token"]);
        print(json.encode(jsonResponse["data"]["api_token"]));
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Beranda()), (Route<dynamic> route) => false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Beranda()));
      }
    }
    else {
      setState(() {
        // _isLoading = false;
        _dialogLoginGagal();
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
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
                  // child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
                  // children: <Widget>?
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
                        )
                      // : _dialogLoginGagal()
                      // AlertDialog(
                      //     content: new Text(
                      //       "Email dan Password Anda Salah, Silahkan Coba Kembali",
                      //       style: new TextStyle(fontSize: 20.0),
                      //     ),
                      //     actions: <Widget>[
                      //       new RaisedButton(
                      //           color: Colors.white70,
                      //           child: new Text("oke"),
                      //           onPressed: () {
                      //             Navigator.pop(context);
                      //           })
                      //     ],
                      //   ),
                  // Container(child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[])
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
