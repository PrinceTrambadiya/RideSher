import 'package:flutter/material.dart';
import 'package:ride_sher/FirstPage.dart';
import 'Login.dart';
import 'Forgetpassword.dart';
import 'welcome.dart';
import 'Driver_details.dart';
//import 'Shared_data.dart';

//SharedData shr;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var page;

  bool banner = false;

  @override
  void initState() {
    // TODO: implement initState
//      _getPrefrence();
//      print(_uname);
//      print(_pass);
//      print(page);
//      print(banner);

    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: banner,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)))),
      //home: Login(),
      home: Welcome(),
//      home: call(),
      routes: <String, WidgetBuilder>{
        '/FirstPage': (BuildContext context) => new FirstPage(),
        '/Login': (BuildContext context) => new Login(),
        //  '/ConfirmPassword': (BuildContext context) => new ConfirmPassword(),
        '/Forgetpassword': (BuildContext context) => new Forgetpassword(),
        '/driver_details': (BuildContext context) => new driver_details(),
      },
    );
  }
}
