import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact})
      : super(key: key); // Mark contact as required
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            const SizedBox(
              height: 45,
              width: 45,
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 23,
                child: Icon(Icons.person),
              ),
            ),
            contact.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 12,
                      child: Icon(Icons.check, size: 18),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
