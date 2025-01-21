import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        name: 'John Doe',
        icon: 'person.svg',
        time: '10:00',
        currentMessage: 'Hello',
        status: 'Fullstack Developer',
        isGroup: false),
    ChatModel(
        name: 'Jane Doe',
        icon: 'person.svg',
        time: '11:00',
        currentMessage: 'Hi',
        status: 'Flutter Developer',
        isGroup: true),
    ChatModel(
        name: 'Jane Doe',
        icon: 'person.svg',
        status: 'Flutter Developer',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];

  List<ChatModel> groups = [
    ChatModel(
        name: 'Group 1',
        icon: 'group.svg',
        time: '10:00',
        currentMessage: 'Hello',
        isGroup: true),
    ChatModel(
        name: 'Group 2',
        icon: 'group.svg',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
    ChatModel(
        name: 'Group 3',
        icon: 'group.svg',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Add participants',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (contacts[index].select == false) {
                  setState(() {
                    contacts[index].select = true;
                  });
                } else {
                  setState(() {
                    contacts[index].select = false;
                  });
                }
              },
              child: ContactCard(
                contact: contacts[index],
              ),
            );
          }),
    );
  }
}
