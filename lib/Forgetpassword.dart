import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  @override
  _ForgetpasswordState createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {

bool _ishidden = true;

void _visibility()
{
  setState(() {
    _ishidden = !_ishidden;
  });
}
var hintText = 'Enter Confirm Password';
  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/ride1.jpg'),fit: BoxFit.fill,colorFilter: ColorFilter.mode(Colors.black87, BlendMode.hardLight) )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),

                child: TextField(style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),

                child: TextField(style: TextStyle(color: Colors.white,fontSize: 18),
                  obscureText: true,

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter New Password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),

                child: TextField(style: TextStyle(color: Colors.white,fontSize: 18),

                  obscureText: hintText == "Enter Confirm Password" ? _ishidden : false,

                  decoration: InputDecoration(suffixIcon: hintText == "Enter Confirm Password" ? IconButton(icon: _ishidden ?Icon(Icons.visibility_off) : Icon(Icons.remove_red_eye), onPressed: _visibility) : null,
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20)),
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: MaterialButton(
                onPressed: () {},
                child: Text('Confirm',style: TextStyle(fontSize: 20),),
                padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
