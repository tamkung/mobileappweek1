import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: -20,
              left: -20,
              child: Image(
                image: NetworkImage(
                    "https://www.publicdomainpictures.net/pictures/310000/velka/orange-circle.png"),
                width: size.width * 0.25,
              ),
            ),
            Positioned(
              right: -20,
              bottom: -20,
              child: Image(
                image: NetworkImage(
                    "https://www.dishwasherhero.com/wp-content/uploads/2020/01/orange-circle-background.png"),
                width: size.width * 0.3,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: size.width,
                ),
                Image.asset(
                  "asset/image/logo_kmutnb.png",
                  width: size.width * 0.4,
                  //height: size.height * 0.4,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome to KMUTNB',
                  style: TextStyle(
                    color: pColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/bc/cc/14/bccc14890b4bd637c5f738e590df1f95.jpg"),
                  width: size.width * 0.8,
                  height: size.height * 0.3,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: tColor,
                    padding: EdgeInsets.fromLTRB(115, 15, 115, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: tColor,
                    padding: EdgeInsets.fromLTRB(110, 15, 110, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Register');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
