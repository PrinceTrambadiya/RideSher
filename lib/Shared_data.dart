import 'package:shared_preferences/shared_preferences.dart';
import 'FirstPage.dart';
import 'package:flutter/material.dart';

Future<bool> getPrefrence() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String uname = pref.getString('uname');
  String pass = pref.getString('pass');
  if (uname != '' && pass != '') {
    return true;
  } else {
    return false;
  }
//return addData(uname, pass);
}

Future<void> savedPrefrence(String uname, String pass) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('uname', uname);
  pref.setString('pass', pass);
  return pref.commit();
}
//
//Future<bool> addData(mobile, pass) async {
//  BuildContext context;
//  Navigator.pushReplacementNamed(context, '/FirstPage');
////
////  if(mobile == '9512252645' && pass == '123')
////  {
////    savedPrefrence(mobile, pass);
////    BuildContext context;
////    Navigator.pushReplacementNamed(context, '/FirstPage');
//////    Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
////
////    return true;
////  }
////  else
////  {
////    return false;
////  }
//
//
////    final response = await http.post(
////        "https://ridesher.000webhostapp.com/login_registration.php",
////        body: {
////          "mobile": mobile,
////        });
////
////    data = json.decode(response.body);
////    var typePass = pass;
////    var fatchPass = data[0]['password'];
////
//////    print(data);
//////    print(fatchPass);
//////    print(typePass);
////
////    if (data.length == 0) {
////      setState(() {
////        print('fail');
////      });
////    }
////
////    if (fatchPass != '' && typePass != '') {
////      if (fatchPass == typePass) {
////        setState(() {
////          //alertBox();
////          savedPrefrence(mobile, typePass);
////          Navigator.pushReplacementNamed(context, '/FirstPage');
////        });
////        return true;
////      } else if (fatchPass != typePass) {
////        setState(() {
////          msg = 'Login Fail';
////        });
////        return false;
////      }
////    }
//}
