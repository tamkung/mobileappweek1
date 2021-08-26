import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
                    color: Colors.amber[900],
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
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[900],
                    padding: EdgeInsets.fromLTRB(110, 15, 110, 15),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
