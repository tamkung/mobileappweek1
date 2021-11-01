import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/dashboard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({Key? key}) : super(key: key);

  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  Future<void> checkUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('Success');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Dashboard());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print(onError);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Firebase'),
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
                  'KMUTNB Login Firebase',
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
                      checkUser();
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
