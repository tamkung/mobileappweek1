import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class PackageVideo extends StatefulWidget {
  const PackageVideo({Key? key}) : super(key: key);

  @override
  _PackageVideoState createState() => _PackageVideoState();
}

class _PackageVideoState extends State<PackageVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
        backgroundColor: pColor,
      ),
      body: Center(
        child: BetterPlayer.network(
          "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(autoPlay: true),
        ),
      ),
    );
  }
}
