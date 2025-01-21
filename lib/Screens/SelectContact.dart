import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '256 contacts',
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
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Invite a friend'),
              ),
              const PopupMenuItem(
                child: Text('Contacts'),
              ),
              const PopupMenuItem(
                child: Text('Refresh'),
              ),
              const PopupMenuItem(
                child: Text('Help'),
              ),
            ];
          }),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const CreateGroup()));
                },
                child: const ButtonCard(
                  name: 'New Group',
                  icon: Icons.group,
                ),
              );
            } else if (index == 1) {
              return const ButtonCard(
                name: 'New Contact',
                icon: Icons.person_add,
              );
            } else if (index == 2) {
              return ContactCard(
                contact: contacts[index],
              );
            }
          }),
    );
  }
}
