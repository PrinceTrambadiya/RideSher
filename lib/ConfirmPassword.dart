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

  var msg = Text('Update Successful');
  var m = mobile;

  FocusNode confirmpasswordfocus;

  bool _ishidden1 = true;
  bool _ishidden2 = true;
  var hintText1 = 'Enter New Password';
  var hintText2 = 'Enter Confirm password';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmpasswordfocus = FocusNode();
  }

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
                autofocus: true,
                onSubmitted: (text) {
                  FocusScope.of(context).requestFocus(confirmpasswordfocus);
                },
                textInputAction: TextInputAction.next,

                style: TextStyle(color: Colors.white),
                obscureText: hintText1 == "Enter New Password" ? _ishidden1 : false,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: hintText1,
                    suffixIcon: hintText1 == "Enter New Password"
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
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: csecondPass,
                focusNode: confirmpasswordfocus,
                onSubmitted: (text) {
                  confirm();
                },
                textInputAction: TextInputAction.done,


                style: TextStyle(color: Colors.white),
                obscureText:
                hintText2 == "Enter Confirm password" ? _ishidden2 : false,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: hintText2,
                    suffixIcon: hintText2 == "Enter Confirm password"
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
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: MaterialButton(
                onPressed: () {
                    confirm();
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
  void confirm()
  {
    setState(() {
      var password = cfirstPass.text;
      var sp = csecondPass.text;
      if (password != '' && sp != '' && password == sp) {
        updatePassword(password, sp);
      }
    });
  }
}
