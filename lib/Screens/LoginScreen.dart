import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Model/ChatModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
        id: 1,
        name: 'John Doe',
        icon: Icons.person,
        time: '10:00',
        currentMessage: 'Hello',
        isGroup: false),
    ChatModel(
        id: 2,
        name: 'Jane Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        id: 3,
        name: 'Foo Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        id: 4,
        name: 'Pogi Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            sourceChat = chatmodels.removeAt(index);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) => Homescreen(
                          chatmodels: chatmodels,
                          sourceChat: sourceChat,
                        )));
          },
          child: ButtonCard(
              name: chatmodels[index].name,
              icon: chatmodels[index].icon,
              time: chatmodels[index].time,
              currentMessage: chatmodels[index].currentMessage,
              isGroup: chatmodels[index].isGroup),
        ),
      ),
    );
  }
}
