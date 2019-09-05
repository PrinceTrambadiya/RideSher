import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
//  String uname;
//  String pass;
//
//  @override
//  Future<void> getPrefrence() async {
//    SharedPreferences pref = await SharedPreferences.getInstance();
//    uname = pref.getString('uname');
//    pass = pref.getString('pass');
//  }

  Widget build(BuildContext context) {
  //  getPrefrence();
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('First'),
//        ),
//        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Center(
//              child: MaterialButton(child: Text('LogOut'),color: Colors.red,onPressed: (){
//                setState(() {
//                  Navigator.pushReplacementNamed(context, '/Login');
//                });
//              }),
//            )
//          ],
//        ));
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(height: 350,width: 500,decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/firstpagebackground.gif'),fit: BoxFit.fill,),),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              GestureDetector(
                onTap: () {

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
                        "As a Driver",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: GestureDetector(
                  onTap: () {

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
                          "As a Rider",
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
