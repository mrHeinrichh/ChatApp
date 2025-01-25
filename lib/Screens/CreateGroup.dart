import 'package:chatapp/CustomUI/AvatarCard.dart';
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
        icon: Icons.person,
        time: '10:00',
        currentMessage: 'Hello',
        status: 'Fullstack Developer',
        isGroup: false),
    ChatModel(
        name: 'Jane Doe',
        icon: Icons.person,
        time: '11:00',
        currentMessage: 'Hi',
        status: 'Flutter Developer',
        isGroup: true),
    ChatModel(
        name: 'Jane Doe',
        icon: Icons.person,
        status: 'Flutter Developer',
        time: '11:00',
        currentMessage: 'Hi',
        isGroup: true),
  ];

  List<ChatModel> groups = [];
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 85 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  setState(() {
                    if (contacts[index - 1].select) {
                      groups.remove(contacts[index - 1]);
                      contacts[index - 1].select = false;
                    } else {
                      groups.add(contacts[index - 1]);
                      contacts[index - 1].select = true;
                    }
                  });
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          groups.isNotEmpty
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: groups.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  groups[index].select = false;
                                  groups.removeAt(index);
                                });
                              },
                              child: AvatarCard(
                                contact: groups[index],
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
