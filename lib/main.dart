import 'package:flutter/material.dart';
import 'package:ride_sher/FirstPage.dart';
import 'Login.dart';
import 'Signup.dart';
import 'Forgetpassword.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)))),
      home: Login(),
      routes: <String,WidgetBuilder>{
        '/FirstPage': (BuildContext context) => new FirstPage(),
        '/Login': (BuildContext context) => new Login(),
        '/Signup': (BuildContext context) => new Signup(),
        '/Forgetpassword': (BuildContext context) => new Forgetpassword(),
      },
    );
  }
}
