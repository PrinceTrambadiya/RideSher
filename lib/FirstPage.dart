import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var ls = new List();

  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("saved_uname");
    prefs.remove("saved_pass");
  }

  logout() {
    removeData();
    Navigator.pushReplacementNamed(context, '/Login');
  }

  @override
  Widget build(BuildContext context) {
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
