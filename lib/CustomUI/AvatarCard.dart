import 'package:chatapp/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: 53,
                width: 50,
                child: const Stack(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 23,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 12,
                        child: Icon(Icons.clear, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
