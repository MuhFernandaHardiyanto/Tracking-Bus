import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'Widget/komponen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _secureText = true;
  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  final TextEditingController nameControler = new TextEditingController();
  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();
  final TextEditingController comfirmPasswordControler = new TextEditingController();

  Widget txtdaftar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Register',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget nama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nama',
          style: label,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: dekorasiKotak,
          height: 60.0,
          child: TextField(
            controller: nameControler,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Masukkan Nama Kamu',
              hintStyle: kotaktext,
            ),
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
              hintText: 'Masukkan Email Kamu',
              hintStyle: kotaktext,
            ),
          ),
        )
      ],
    );
  }

  Widget katasandi() {
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

  Widget ulangikatasandi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ulangi Kata Sandi',
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
            controller: comfirmPasswordControler,
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
              hintText: 'Ulangi Kata Sandi',
              hintStyle: kotaktext,
            ),
          ),
        ),
      ],
    );
  }

  Widget btnDaftar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('berhasil Daftar'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Daftar',
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

  Widget memilikiakun() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new Login(),
      )),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Sudah memiliki akun?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Masuk',
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
                      txtdaftar(),
                      SizedBox(
                        height: 10.0,
                      ),
                      nama(),
                      SizedBox(
                        height: 10.0,
                      ),
                      email(),
                      SizedBox(
                        height: 10.0,
                      ),
                      katasandi(),
                      SizedBox(
                        height: 10.0,
                      ),
                      ulangikatasandi(),
                      SizedBox(
                        height: 10.0,
                      ),
                      btnDaftar(),
                      memilikiakun(),
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
