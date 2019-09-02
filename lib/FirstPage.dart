import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String pass;
  String uname;
//
//  @override
  Future<void> getPrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uname = pref.getString('uname');
    pass = pref.getString('pass');
    return [uname, pass];
  }

  Widget build(BuildContext context) {
    var ls = getPrefrence();
    return Scaffold(
        appBar: AppBar(
          title: Text('First'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: MaterialButton(child: Text('LogOut'),color: Colors.red,onPressed: (){
                setState(() {
                  Navigator.pushReplacementNamed(context, '/Login');
                });
              }),
            ),
            Text(uname.toString()),
            Text(pass.toString()),

          ],
        ));
  }
}
