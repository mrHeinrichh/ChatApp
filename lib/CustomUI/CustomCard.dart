import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text(
        'Title',
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(width: 3),
          Text('Subtitle'),
        ],
      ),
      trailing: Text('18:04'),
    );
  }
}
