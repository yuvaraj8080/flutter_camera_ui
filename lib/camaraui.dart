import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Icon(Icons.flash_auto, color: Colors.blue),
            SizedBox(width: 40), // Adding some space between icons
            Icon(Icons.hd, color: Colors.blue),
            SizedBox(width: 40),
            Icon(Icons.color_lens_outlined, color: Colors.blue),
            SizedBox(width: 40),
            Icon(Icons.lens, color: Colors.blue),
            SizedBox(width: 40),
            Icon(Icons.filter, color: Colors.blue),
            SizedBox(width: 30),
            Icon(Icons.settings, color: Colors.blue),
          ],
        ),
      ),
      body: Container(
          height:double.infinity,
          width: double.infinity,
          child: Image(image:AssetImage("asset/img_1.png"),fit:BoxFit.cover)),
    );
  }
}
