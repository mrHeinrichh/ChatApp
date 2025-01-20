import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/IndividualPage.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: chatModel.isGroup
                  ? const Icon(
                      Icons.group,
                      size: 38,
                    )
                  : const Icon(
                      Icons.person,
                      size: 38,
                    ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.name,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(
                  chatModel.currentMessage,
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 0.5,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
