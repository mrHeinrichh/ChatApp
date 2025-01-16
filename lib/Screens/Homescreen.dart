import 'package:flutter/material.dart';

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
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(text: 'CHATS'),
          Tab(text: 'STATUS'),
          Tab(text: 'CALLS'),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Center(child: Text('Camera')),
        Center(child: Text('Chats')),
        Center(child: Text('Status')),
        Center(child: Text('Calls')),
      ]),
    );
  }
}
