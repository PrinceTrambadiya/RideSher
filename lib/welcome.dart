import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


String _uname = 'hi', _pass = '';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int flag= 0;
  _getPrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _uname = pref.getString('saved_uname');
    _pass = pref.getString('saved_pass');
    print(_uname);
    print(_pass);
    if (_uname != 'hi') {
//      Navigator.pushReplacementNamed(context, '/FirstPage');
      flag =1;
      print("bar");
    }
  }

  start_Timer() async {
    var duration = Duration(seconds: 1);
    return new Timer(duration, callback);
  }

  void callback() {
//    _getPrefrence();
    if(flag==1){
    Navigator.pushReplacementNamed(context, '/FirstPage');
    }
    else Navigator.pushReplacementNamed(context, '/Login');
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPrefrence();
    start_Timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('welcome to rideshare',style: TextStyle(color: Colors.red,fontSize: 35),)],
          ),
        ),
      ),
    );
  }
}
