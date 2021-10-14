import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobileappweek1/config/constant.dart';

class PackageLocation extends StatefulWidget {
  const PackageLocation({Key? key}) : super(key: key);

  @override
  _PackageLocationState createState() => _PackageLocationState();
}

class _PackageLocationState extends State<PackageLocation> {
  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    //คำสั่งดึง Location
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    // แปลง ละติจูด และลองจิจูด เป็น สถานที่จริง
    var address =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: pColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ละติจูด : ' + latitude,
              style: TextStyle(fontSize: 26),
            ),
            Text(
              'ลองติจูด : ' + longitude,
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
