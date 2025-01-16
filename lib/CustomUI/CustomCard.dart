import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.group,
                size: 38,
              ),
              backgroundColor: Colors.blueGrey,
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
          ),
          Padding(
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
