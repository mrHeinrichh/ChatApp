import 'package:chatapp/CustomUI/CustomCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.chatmodels, required this.sourceChat})
      : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourceChat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'John Doe',
        icon: Icons.person,
        time: '10:00',
        currentMessage: 'Hello',
        isGroup: false),
    ChatModel(
        name: 'Jane Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        name: 'Jane Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        name: 'asdasdas Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const SelectContact()));
        },
        child: const Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (context, index) => CustomCard(
          sourceChat: widget.sourceChat,
          chatModel: widget.chatmodels[index],
        ),
      ),
    );
  }
}
