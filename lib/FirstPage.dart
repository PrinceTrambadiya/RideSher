import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String uname;
  String pass;

  @override
  Future<void> getPrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uname = pref.getString('uname');
    pass = pref.getString('pass');
  }

  Widget build(BuildContext context) {
    getPrefrence();
    return Scaffold(
        appBar: AppBar(
          title: Text('First'),
        ),
        body: Column(
          children: <Widget>[
            Text('dgvg'),
            Text('ddgf'),
          ],
        ));
  }
}
