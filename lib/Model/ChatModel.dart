import 'package:flutter/material.dart';

class ChatModel {
  int id;
  final String name;
  final IconData icon;
  bool isGroup;
  final String time;
  final String currentMessage;
  final dynamic status;
  bool select = false;

  ChatModel({
    this.id = 0,
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    this.status,
    this.select = false,
  });
}
