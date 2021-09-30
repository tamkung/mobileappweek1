import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: Container(
          color: Colors.blue[100],
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 150,
                child: Text(
                  'data',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
