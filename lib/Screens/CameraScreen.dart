import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatapp/Screens/CameraViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[1], ResolutionPreset.max);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox.expand(
                  child: CameraPreview(_cameraController),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.flash_off),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                      GestureDetector(
                        onLongPress: () {},
                        onLongPressUp: () {},
                        onTap: () {
                          takePhoto(context);
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.flip_camera_ios),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController
        .dispose(); // Dispose of the camera controller to release resources
    super.dispose();
  }

  void takePhoto(BuildContext context) async {
    try {
      // Take the picture
      XFile picture = await _cameraController.takePicture();

      // Get the file path
      final String path = picture.path;

      // Check if the file exists
      final file = File(path);
      if (await file.exists()) {
        print('File saved at $path');
      } else {
        print('Error: File does not exist at $path');
      }

      // Navigate to CameraViewScreen after confirming the file exists
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraViewScreen(path: path),
        ),
      );
    } catch (e) {
      print('Error taking picture: $e');
    }
  }
}
