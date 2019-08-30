import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'dart:math';

var date1 = '';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

String emailValue = '';
String mobileValue = '';
Pattern pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
Pattern pattern2 = r'^[789]\d{9}$';

class _SignupState extends State<Signup> {
  TextEditingController cname = new TextEditingController();
  TextEditingController cmobile = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  TextEditingController cconfirmpassword = new TextEditingController();
  TextEditingController cemail = new TextEditingController();
  TextEditingController cdob = new TextEditingController();
  TextEditingController caddress = new TextEditingController();
  TextEditingController centerOPT = new TextEditingController();

  var rng = new Random();
  var random;

  DateTime _dateTime;
  RegExp regex = new RegExp(pattern);
  RegExp regex2 = new RegExp(pattern2);

  var error = Text('Error');
  var success = Text('You are Done.');

  bool _ishidden1 = true;
  bool _ishidden2 = true;
  var hintText1 = 'Password';
  var hintText2 = 'Confirm password';
  void _visibility1() {
    setState(() {
      _ishidden1 = !_ishidden1;
    });
  }

  void _visibility2() {
    setState(() {
      _ishidden2 = !_ishidden2;
    });
  }

  void addData() {
    var url = "https://ridesher.000webhostapp.com/insert_registration.php";
    http.post(url, body: {
      "name": cname.text,
      "password": cpassword.text,
      "email": cemail.text,
      "mobile": cmobile.text,
      "dob": cdob.text,
      "address": caddress.text
    });
  }

  void validUser() {
    random = rng.nextInt(1000000);
    var url1 = "https://ridesher.000webhostapp.com/sendSMS.php";
    http.post(url1, body: {
      "mobile": cmobile.text,
      "text": random.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ride1.jpg'),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black87, BlendMode.hardLight))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//              child: Image.asset(
//                'images/backgroundgif.gif',
//                height: 200,
//              ),
//            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 75, 15, 0),
                child: TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  controller: cname,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  controller: cemail,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Email Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  controller: cmobile,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Mobile number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
//                  onTap: () {
//                    showDatePicker(
//                            context: context,
//                            initialDate: DateTime.now(),
//                            firstDate: DateTime(1970),
//                            lastDate: DateTime(2222))
//                        .then((date) {
//                      setState(() {
//                        _dateTime = date;
//                        date1 = _dateTime.toIso8601String();
//                      });
//                    });
//                  },
                  controller: cdob,
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Date Of Birth',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: caddress,
                  maxLines: 4,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  controller: cpassword,
                  style: TextStyle(color: Colors.white),
                  obscureText: hintText1 == "Password" ? _ishidden1 : false,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: 'Password',
                      suffixIcon: hintText1 == "Password"
                          ? IconButton(
                              icon: _ishidden1
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.blue,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    ),
                              onPressed: _visibility1)
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: TextField(
                  controller: cconfirmpassword,
                  style: TextStyle(color: Colors.white),
                  obscureText:
                      hintText2 == "Confirm password" ? _ishidden2 : false,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(35.0)),
                      hintText: hintText2,
                      suffixIcon: hintText2 == "Confirm password"
                          ? IconButton(
                              icon: _ishidden2
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.blue,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    ),
                              onPressed: _visibility2)
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0))),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.cyan])),
                child: MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    setState(() {
                      var n = cname.text;
                      var m = cmobile.text;
                      var p = cpassword.text;
                      var a = caddress.text;
                      var d = cdob.text;
                      var e = cemail.text;
                      var cp = cconfirmpassword.text;
                      if (regex.hasMatch(e) &&
                          regex2.hasMatch(m) &&
                          n != "" &&
                          m != "" &&
                          p != "" &&
                          a != "" &&
                          d != "" &&
                          e != "" &&
                          p == cp) {
                        //addData();
                        //validUser();
                        AlertDialog dialog = new AlertDialog(
                          backgroundColor: Colors.cyan,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(30)),
                          content: Column(
                            children: <Widget>[
                              Text('User Verifaction'),
                              TextField(
                                controller: centerOPT,
                                decoration:
                                InputDecoration(hintText: 'Enter OTP'),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
//                                  Navigator.pop(context);
//                                  Navigator.pop(context);
//                                  Navigator.pushReplacementNamed(context, '/Login');;
                                  setState(() {
                                    if (centerOPT.text == random.toString()) {
                                      addData();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(
                                          context, '/Login');
                                    }
                                  });
                                },
                                child: Text('Done',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red))),
                          ],
                        );

                        showDialog(context: context, child: dialog);
                      } else {
                        error;
                      }
                    });
                  },
                  child: Container(
                    child: Text(
                      'GENERATE OTP',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  //color: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
