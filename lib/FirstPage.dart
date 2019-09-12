import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Driver_details.dart';

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
//      appBar: AppBar(
//        title: Text('Home Page'),
//      ),
      body: Center(
        child: Container(
          height: 350,
          width: 500,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('images/firstpagebackground.gif'),
//              fit: BoxFit.fill,
//            ),
//          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.cyan])),
                child: Center(
                    child: MaterialButton(
                  splashColor: Colors.black,
                  child: Text("As a Driver", style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => driver_details()));
                    });
                  },
                  padding: EdgeInsets.fromLTRB(76, 5, 76, 5),
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.cyan])),
                  child: Center(
                      child: MaterialButton(
                    splashColor: Colors.black,
                    child: Text("As a Rider", style: TextStyle(fontSize: 18)),
                    onPressed: () {},
                    padding: EdgeInsets.fromLTRB(80, 5, 80, 5),
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.cyan])),
                  child: Center(
                      child: MaterialButton(
                    splashColor: Colors.black,
                    child: Text("Log Out", style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      logout();
                    },
                    padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
