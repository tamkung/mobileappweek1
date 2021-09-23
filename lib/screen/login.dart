import 'package:flutter/material.dart';
import 'package:mobileappweek1/backend/database.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: pColor,
      ),
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'KMUTNB Login',
                  style: TextStyle(fontSize: 25, color: pColor),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                        color: pColor,
                        size: size.height * 0.05,
                      ),
                      hintText: "Email",
                    ),
                    onSaved: (value) {
                      email = value!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: pColor,
                        size: size.height * 0.05,
                      ),
                      hintText: "Password",
                    ),
                    onSaved: (value) {
                      password = value!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: tColor)),
                    onPressed: () {
                      formKey.currentState!.save();

                      var local = DBlocal();
                      local.login(email, password).then((response) {
                        if (response) {
                          print('success');
                          Navigator.pushNamed(context, 'Dashboard');
                        } else {
                          print('fail');
                          _onBasicAlertPressed(context);
                          /*
                          final snackBar = SnackBar(
                            content: Text('ไม่พบข้อมูล'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                        }
                      });
                    },
                    color: tColor,
                    textColor: Colors.white,
                    child: Text("login".toUpperCase(),
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'All rights reserved',
                  style: TextStyle(
                    fontSize: 16,
                    color: sColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "ไม่พบข้อมูล",
      //desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }
}
