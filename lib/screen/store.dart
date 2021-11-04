import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/store/adddata.dart';
import 'package:mobileappweek1/screen/store/viewdata.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store'),
          backgroundColor: pColor,
        ),
        body: TabBarView(
          children: [
            AddData(),
            ViewData(),
          ],
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            indicatorColor: Colors.red,
            labelColor: tColor,
            tabs: [
              Tab(
                //text: 'Add Data',
                icon: Icon(Icons.add),
              ),
              Tab(
                //text: 'View Data',
                icon: Icon(Icons.view_agenda),
              ),
            ],
          ),
          color: Colors.amber[400],
        ),
      ),
    );
  }
}
