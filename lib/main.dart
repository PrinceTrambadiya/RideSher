import 'package:flutter/material.dart';
import 'package:ride_sher/FirstPage.dart';
import 'Login.dart';
import 'Shared_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (getPrefrence() == true) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)))),
        home: FirstPage(),
        routes: <String, WidgetBuilder>{
          '/FirstPage': (BuildContext context) => new FirstPage(),
          '/Login': (BuildContext context) => new Login(),
        },
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)))),
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/FirstPage': (BuildContext context) => new FirstPage(),
          '/Login': (BuildContext context) => new Login(),
        },
      );
    }
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//          inputDecorationTheme: InputDecorationTheme(
//              border: OutlineInputBorder(
//                  borderSide: BorderSide(color: Colors.red)))),
//      home: Login(),
//      routes: <String,WidgetBuilder>{
//        '/FirstPage': (BuildContext context) => new FirstPage(),
//        '/Login': (BuildContext context) => new Login(),
//      },
//    );
  }
}
