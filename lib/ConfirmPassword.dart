import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var mobile;

class ConfirmPassword extends StatefulWidget {
  var mobile1;

  ConfirmPassword(var mobile1) {
    this.mobile1 = mobile1;
    mobile = mobile1;
  }
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  TextEditingController cfirstPass = new TextEditingController();
  TextEditingController csecondPass = new TextEditingController();
  bool _ishidden = true;
  var msg = Text('Update Successful');
  var m = mobile;

  void _visibility() {
    setState(() {
      _ishidden = !_ishidden;
    });
  }

  void updatePassword(password, sp) {
    setState(() {
      var mobile2 = m;
//      print(mobile2);
//      print(fp);
      var url = "https://ridesher.000webhostapp.com/updatePassword.php";
      http.post(url, body: {"mobile": mobile2, "password": password});
      alertBox();
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
        content: msg,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
//                                  Navigator.pop(context);
//                                  Navigator.pop(context);
//                                  Navigator.pushReplacementNamed(context, '/Login');;
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/Login');
              },
              child: Text('Done',
                  style: TextStyle(fontSize: 25, color: Colors.red))),
        ],
      );
      showDialog(context: context, child: dialog);
    });
  }

  var hintText = 'Enter Confirm Password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/ride1.jpg'),
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Colors.black87, BlendMode.hardLight))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: cfirstPass,
                style: TextStyle(color: Colors.white, fontSize: 18),
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter New Password',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: csecondPass,
                style: TextStyle(color: Colors.white, fontSize: 18),
                obscureText:
                    hintText == "Enter Confirm Password" ? _ishidden : false,
                decoration: InputDecoration(
                    suffixIcon: hintText == "Enter Confirm Password"
                        ? IconButton(
                            icon: _ishidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye),
                            onPressed: _visibility)
                        : null,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    var password = cfirstPass.text;
                    var sp = csecondPass.text;
                    if (password != '' && sp != '' && password == sp) {
                      updatePassword(password, sp);
                    }
                  });
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
