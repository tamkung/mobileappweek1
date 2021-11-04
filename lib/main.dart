import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/dashboard.dart';
import 'package:mobileappweek1/screen/firebaseLogin.dart';
import 'package:mobileappweek1/screen/firebaseRegistor.dart';
import 'package:mobileappweek1/screen/index.dart';
import 'package:mobileappweek1/screen/login.dart';
import 'package:mobileappweek1/screen/packageImage.dart';
import 'package:mobileappweek1/screen/packageLocation.dart';
import 'package:mobileappweek1/screen/packageVideo.dart';
import 'package:mobileappweek1/screen/register.dart';
import 'package:mobileappweek1/screen/store.dart';

//void main() => runApp(MyApp());

Future<void> main() async {
  //เปิด Connection Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Index': (context) => Index(),
        'Login': (context) => FirebaseLogin(),
        'Register': (context) => FirebaseRegister(),
        'Dashboard': (context) => Dashboard(),
        'Video': (context) => PackageVideo(),
        'Image': (context) => PackageImage(),
        'Location': (context) => PackageLocation(),
        'Store': (context) => Store(),
      },
      theme: ThemeData(
        primaryColor: tColor,
        secondaryHeaderColor: tColor,
      ),
    );
  }
}
