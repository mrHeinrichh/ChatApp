import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatapp/Screens/CameraViewScreen.dart';
import 'package:chatapp/Screens/VideoView.dart';
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
  bool IsRecording = false;
  String videopath = "";
  bool flash = false;
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
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        color: Colors.white,
                        iconSize: 28,
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          try {
                            await _cameraController.startVideoRecording();
                            print('Video recording started');
                            setState(() {
                              IsRecording = true;
                            });
                          } catch (e) {
                            print('Error starting video recording: $e');
                          }
                        },
                        onLongPressUp: () async {
                          if (IsRecording) {
                            try {
                              final XFile videoFile =
                                  await _cameraController.stopVideoRecording();
                              print('Video recording stopped');

                              // Save the video to a specific path
                              final path = join(
                                (await getTemporaryDirectory()).path,
                                '${DateTime.now()}.mp4',
                              );

                              await videoFile.saveTo(path);
                              videopath = path;
                              print('Video saved to $path');

                              setState(() {
                                IsRecording = false;
                              });

                              // Navigate to the VideoViewPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoViewPage(path: videopath),
                                ),
                              );
                            } catch (e) {
                              print('Error stopping video recording: $e');
                            }
                          }
                        },
                        onTap: () {
                          if (!IsRecording) {
                            takePhoto(context);
                          }
                        },
                        child: IsRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_cameraController.description.lensDirection ==
                              CameraLensDirection.front) {
                            _cameraController = CameraController(
                                cameras[0], ResolutionPreset.max);
                          } else {
                            _cameraController = CameraController(
                                cameras[1], ResolutionPreset.max);
                          }
                          cameraValue = _cameraController.initialize();
                          setState(() {});
                        },
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
