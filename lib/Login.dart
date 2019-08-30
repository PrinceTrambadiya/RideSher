import 'package:flutter/material.dart';
import 'Signup.dart';
import 'Forgetpassword.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

var data;

class _LoginState extends State<Login> {
  var msg = '';

  Future<List> addData() async {
    final response = await http.post(
        "https://ridesher.000webhostapp.com/login_registration.php",
        body: {
          "mobile": cmobile.text,
        });

    data = json.decode(response.body);
    var typePass = cpassword.text;
    var fatchPass = data[0]['password'];

    print(data);
    print(fatchPass);
    print(typePass);

    if (data.length == 0) {
      setState(() {
        print('fail');
      });
    }

    if (fatchPass != '' && typePass != '') {
      if (fatchPass == typePass) {
        setState(() {
          Navigator.pushReplacementNamed(context, '/FirstPage');
        });
      } else if (fatchPass != typePass) {
        setState(() {
          msg = 'Login Fail';
        });
      }
    }
  }

  TextEditingController cmobile = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();

  bool _ishidden = true;

  void _visibility() {
    setState(() {
      _ishidden = !_ishidden;
    });
  }

  var hintText1 = 'Password';
  @override
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
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Image.asset(
                'images/backgroundgif.gif',
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 75, 15, 0),
              child: TextField(
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
                      Icons.vpn_key,
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
              child: GestureDetector(
                onTap: addData,
                child: Container(
                  height: 50,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.cyan])),
                  child: Center(
                      child: Text(
                    "Let's get Started",
                    style: TextStyle(fontSize: 18),
                  )),
                ),
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
