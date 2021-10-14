import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileappweek1/config/constant.dart';

class PackageImage extends StatefulWidget {
  const PackageImage({Key? key}) : super(key: key);

  @override
  _PackageImageState createState() => _PackageImageState();
}

class _PackageImageState extends State<PackageImage> {
  var file;

  Future<void> openCamera() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(photo!.path);
    });

    print(file);
  }

  Future<void> openGallery() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      file = File(photo!.path);
    });

    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        backgroundColor: pColor,
        actions: [
          IconButton(
            onPressed: () async {
              openGallery();
            },
            icon: Icon(Icons.photo_album),
          ),
        ],
      ),
      body: Center(child: file == null ? Text('Not Found') : Image.file(file)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        backgroundColor: pColor,
        onPressed: () {
          print('Open Camera');
          openCamera();
        },
      ),
    );
  }
}
