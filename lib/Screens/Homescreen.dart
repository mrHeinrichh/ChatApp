import 'package:flutter/material.dart';
import 'package:chatapp/Pages/ChatPage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('New group')),
                    const PopupMenuItem(child: Text('New broadcast')),
                    const PopupMenuItem(child: Text('WhatsApp Web')),
                    const PopupMenuItem(child: Text('Starred messages')),
                    const PopupMenuItem(child: Text('Settings')),
                  ]),
        ],
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Center(child: Text('Camera')),
        ChatPage(),
        Center(child: Text('Status')),
        Center(child: Text('Calls')),
      ]),
    );
  }
}
