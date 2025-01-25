import 'package:camera/camera.dart';
import 'package:chatapp/Screens/CameraScreen.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:chatapp/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.red,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
