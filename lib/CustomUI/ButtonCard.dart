import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    this.name = '',
    this.icon, // Made optional and nullable
    this.time = '',
    this.currentMessage = '',
    this.isGroup = false,
  }) : super(key: key);
  final String name;
  final IconData? icon;
  final String time;
  final String currentMessage;
  final bool isGroup;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(
          icon ?? Icons.person,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
