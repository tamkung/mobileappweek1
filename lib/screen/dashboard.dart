import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: pColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Dashboard',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
