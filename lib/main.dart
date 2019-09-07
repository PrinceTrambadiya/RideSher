import 'package:flutter/material.dart';
import 'package:ride_sher/FirstPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'ConfirmPassword.dart';
import 'Forgetpassword.dart';
import 'welcome.dart';
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
  String _uname = '',
      _pass = '';

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
  _getPrefrence() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _uname = pref.getString('saved_uname');
    _pass = pref.getString('saved_pass');
    print(_uname);
    print(_pass);
    if (_uname != '') {
      //page = FirstPage();
      Navigator.pushReplacementNamed(context, '/FirstPage');
      banner = true;
    }
    else {
      Navigator.pushReplacementNamed(context, '/Login');
//      page = Login();
      banner = false;
    }

    //return Future.delayed(Duration(seconds: 5), () => throw Exception('Logout failed: user ID is invalid'));

  }


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
      routes: <String,WidgetBuilder>{
        '/FirstPage': (BuildContext context) => new FirstPage(),
        '/Login': (BuildContext context) => new Login(),
        //  '/ConfirmPassword': (BuildContext context) => new ConfirmPassword(),
        '/Forgetpassword': (BuildContext context) => new Forgetpassword(),
      },
    );
  }


}
