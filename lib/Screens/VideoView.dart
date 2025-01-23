import 'dart:io';
import 'package:flutter/material.dart';

class VideoViewPage extends StatelessWidget {
  VideoViewPage({Key? key, this.path}) : super(key: key);
  final String? path;

  @override
  Widget build(BuildContext context) {
    // Check if path is null and handle the error gracefully
    if (path == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Camera View'),
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Text('No image path provided'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Camera View'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.crop_rotate),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.title),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path!), // Now safe to use because null check is done
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Add a caption...',
                    suffixIcon: CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.check, color: Colors.white)),
                    prefixIcon:
                        Icon(Icons.add_photo_alternate, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
