import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: const Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 30,
                    left: 10,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    'This is a message',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        '20:58',
                        style: TextStyle(fontSize: 12),
                      ),
                      Icon(
                        Icons.done_all,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
