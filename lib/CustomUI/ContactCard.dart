import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact})
      : super(key: key); // Mark contact as required
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        child: Icon(Icons.person),
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
