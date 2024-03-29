import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import 'Signup.dart';
import 'Forgetpassword.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math';
//import 'Shared_data.dart';

//SharedData shr;
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

var data;
Pattern pattern2 = r'^[789]\d{9}$';

class _LoginState extends State<Login> {
  FocusNode passwordfocus;

  TextEditingController cmobile = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  TextEditingController centerOPT = new TextEditingController();
  var rng = new Random();
  var random;
  var msg = '';
  var hintText1 = 'Password';

  RegExp regex2 = new RegExp(pattern2);

  bool _ishidden = true;

  void _visibility() {
    setState(() {
      _ishidden = !_ishidden;
    });
  }

  Future<void> savedPrefrence(String uname, String pass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('saved_uname', uname);
    pref.setString('saved_pass', pass);
    pref.commit();
    return;
  }

  Future<void> addData(mobile, pass) async {
//    if (mobile == '9512252645' && pass == '123') {
//      //  print(pass+"in add data"+mobile);
//      savedPrefrence(mobile, pass);
//      Navigator.pushReplacementNamed(context, '/FirstPage');
//      return true;
//    } else {
//      setState(() {
//        msg = 'Login Fail';
//      });
//      return false;
//    }

    final response = await http.post(
        "https://ridesher.000webhostapp.com/login_registration.php",
        body: {
          "mobile": mobile,
        });

    data = json.decode(response.body);
    var typePass = pass;
    var fatchPass = data[0]['password'];

//    print(data);
    print(fatchPass);
    print(typePass);

    if (fatchPass == '') {
      setState(() {
        msg = 'Login Fail';
      });
    }

    if (fatchPass == typePass) {
      print("ganesh");
      setState(() {
        alertBox();
//          savedPrefrence(mobile, typePass);
//          Navigator.pushReplacementNamed(context, '/FirstPage');
      });
      //return true;
    } else if (fatchPass != typePass) {
      setState(() {
        msg = 'Login Fail';
      });
      //  return false;
    } else {
      setState(() {
        msg = 'Login Fail';
      });
    }
  }

  void validUser() {
    random = rng.nextInt(1000000);
    var url1 = "https://ridesher.000webhostapp.com/sendSMS.php";
    http.post(url1, body: {
      "mobile": cmobile.text,
      "text": random.toString(),
    });
  }

  void alertBox() {
    setState(() {
      //   validUser();
      AlertDialog dialog = new AlertDialog(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30)),
        title: Text('User Verifaction'),
        content: TextField(
          controller: centerOPT,
          decoration: InputDecoration(hintText: 'Enter OTP'),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/Login');
                });
              },
              child: Text('Cancle',
                  style: TextStyle(fontSize: 25, color: Colors.red))),
          FlatButton(
              onPressed: () {
                var m = cmobile.text;
                var p = cpassword.text;
//                                  Navigator.pop(context);
//                                  Navigator.pop(context);
//                                  Navigator.pushReplacementNamed(context, '/Login');;
                setState(() {
//                  if (centerOPT.text == random.toString()) {
//
                  //return true;
//                  } else {
//                   return false;
//                  }
//                  Navigator.pop(context);
                  savedPrefrence(m, p);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/FirstPage');
                  return true;
                });
              },
              child: Text('Done',
                  style: TextStyle(fontSize: 25, color: Colors.red))),
        ],
      );
      showDialog(context: context, child: dialog);
    });
  }

  void getstarted() {
    setState(() {
      var m = cmobile.text;
      var p = cpassword.text;
      print(m);
      print(p);
      if (regex2.hasMatch(m) && m != "" && p != "") {
        addData(m.toString(), p);
//                      if (addData(m.toString(),p)==true) {
//print('adddata');
//                        if(alertBox()== true)
//                        {
//                          print('alert');
//                          savedPrefrence(m, p);
//                          Navigator.pushReplacementNamed(context, '/FirstPage');
//                        }
//
//                      }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordfocus = FocusNode();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/ride1.jpg'),
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Colors.black87, BlendMode.hardLight))),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Image.asset(
                'images/backgroundgif.gif',
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 75, 15, 0),
              child: TextField(
                textInputAction: TextInputAction.next,
                autofocus: true,
                onSubmitted: (text) {
                  FocusScope.of(context).requestFocus(passwordfocus);
                },
                controller: cmobile,
                style: TextStyle(color: Colors.white, fontSize: 18),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(35.0)),
                    hintText: 'Mobile Number',
                    icon: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(35.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: TextField(
                textInputAction: TextInputAction.done,
                focusNode: passwordfocus,
                onSubmitted: (text) {
                  getstarted();
                },
                controller: cpassword,
                style: TextStyle(color: Colors.white, fontSize: 18),
                obscureText: hintText1 == "Password" ? _ishidden : false,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(35.0)),
                    hintText: hintText1,
                    suffixIcon: hintText1 == "Password"
                        ? IconButton(
                            icon: _ishidden
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.blue,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blue,
                                  ),
                            onPressed: _visibility)
                        : null,
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(
                      Icons.lock,
                      size: 45,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(270, 10, 0, 0),
              child: InkWell(
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Forgetpassword()));
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 15, 100, 0),
              child: Container(
                height: 50,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.cyan])),
                child: Center(
                    child: MaterialButton(
                  splashColor: Colors.black,
                  child: Text("LOGIN", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    getstarted();
                  },
                  padding: EdgeInsets.fromLTRB(33, 5, 33, 5),
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    "Don't have an account?  ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: InkWell(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      });
                    },
                  ),
                ),
              ],
            ),
            Center(
                child: Text(
              msg,
              style: TextStyle(color: Colors.red, fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
