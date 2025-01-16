class ChatModel {
  final String name;
  final String icon;
  bool isGroup;
  final String time;
  final String currentMessage;

  ChatModel(
      {required this.name,
      required this.icon,
      required this.isGroup,
      required this.time,
      required this.currentMessage});
}
