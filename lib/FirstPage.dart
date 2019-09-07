import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _uname = "hi  ";
  String _pass = "pas  ";
  var ls = new List();

  @override
  _getPrefrence1() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _uname = pref.getString('saved_uname');
    _pass = pref.getString('saved_pass');
    return Future.delayed(Duration(seconds: 5), () => throw Exception(
        'Logout failed: user ID is invalid'));
  }

  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("saved_uname");
    prefs.remove("saved_pass");
  }

  logout() {
    removeData();
    Navigator.pushReplacementNamed(context, '/Login');
  }

  Widget build(BuildContext context) {
    _getPrefrence1();
//          ],
//        ));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/firstpagebackground.gif'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient:
                      LinearGradient(colors: [Colors.blue, Colors.cyan])),
                  child: Center(
                      child: Text(
                        "As a Driver",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
              Text(
                _uname,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                _pass,
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient:
                        LinearGradient(colors: [Colors.blue, Colors.cyan])),
                    child: Center(
                        child: Text(
                          "As a Rider",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    logout();
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient:
                        LinearGradient(colors: [Colors.blue, Colors.cyan])),
                    child: Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
