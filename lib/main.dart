import 'package:flutter/material.dart';
import 'package:ride_sher/FirstPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'ConfirmPassword.dart';
import 'Forgetpassword.dart';
import 'Shared_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var page;
  bool banner;
  @override
  Widget build(BuildContext context) {
    if (getPrefrence() == true) {
      page = FirstPage();
      banner = true;
    }
    else {
      page = Login();
      banner = false;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: banner,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)))),
      //home: Login(),
      home: page,
//      home: call(),
      routes: <String,WidgetBuilder>{
        '/FirstPage': (BuildContext context) => new FirstPage(),
        '/Login': (BuildContext context) => new Login(),
        //  '/ConfirmPassword': (BuildContext context) => new ConfirmPassword(),
        '/Forgetpassword': (BuildContext context) => new Forgetpassword(),
      },
    );
  }

}
