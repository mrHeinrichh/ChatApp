import 'package:ChatApp/CustomUI/CustomCard.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.message),
      ),
      body: ListView(
        children: const [
          CustomCard(),
          CustomCard(),
        ],
      ),
    );
  }
}
