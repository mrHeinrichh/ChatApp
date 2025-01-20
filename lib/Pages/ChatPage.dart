import 'package:chatapp/CustomUI/CustomCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'John Doe',
        icon: 'person.svg',
        time: '10:00',
        currentMessage: 'Hello',
        isGroup: false),
    ChatModel(
        name: 'Jane Doe',
        icon: 'person.svg',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        name: 'Jane Doe',
        icon: 'person.svg',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        name: 'Jane Doe',
        icon: 'person.svg',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
