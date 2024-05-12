import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        _controller = CameraController(
          cameras[0], // Use the first camera available
          ResolutionPreset.medium,
        );
        _initializeControllerFuture = _controller.initialize();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameras.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Camera'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Icon(Icons.flash_auto,color:Colors.blue,),
            SizedBox(width: 40), // Adding some space between icons
            Icon(Icons.hd,color:Colors.blue,),
            SizedBox(width: 40),
            Icon(Icons.color_lens_outlined,color:Colors.blue,),
            SizedBox(width: 40),
            Icon(Icons.lens,color:Colors.blue,),
            SizedBox(width: 40),
            Icon(Icons.filter,color:Colors.blue,),
            SizedBox(width: 30),
            Icon(Icons.settings,color:Colors.blue,),
          ],
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera,color: Colors.blue,size:50,),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            // Do something with the captured image
          } catch (e) {
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}
