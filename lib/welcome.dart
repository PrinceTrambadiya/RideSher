import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'FirstPage.dart';

String _uname = 'hi', _pass = '';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  _getPrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _uname = pref.getString('saved_uname');
    _pass = pref.getString('saved_pass');
    print("JOJO" + _uname);
    print("KUKU" + _pass);
    if (_uname != 'hi') {
      Navigator.pushReplacementNamed(context, '/FirstPage');
      print("bar");
    }
  }

  start_timer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, callback);
  }

  void callback() {
    _getPrefrence();
    Navigator.pushReplacementNamed(context, '/Login');
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPrefrence();
    start_timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('welcome to rideshare')],
          ),
        ),
      ),
    );
  }
}
