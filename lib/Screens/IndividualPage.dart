import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel}) : super(key: key);
  final chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: widget.chatModel.isGroup
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
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatModel.name),
                  const Text(
                    'Last seen today at 12:05',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              )),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('View contact')),
                    const PopupMenuItem(child: Text('Media, links, and docs')),
                    const PopupMenuItem(child: Text('Search')),
                    const PopupMenuItem(child: Text('Mute notifications')),
                    const PopupMenuItem(child: Text('Wallpaper')),
                    const PopupMenuItem(child: Text('More')),
                  ]),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.emoji_emotions),
                    onPressed: () {},
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.attach_file),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: const Icon(Icons.mic),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
