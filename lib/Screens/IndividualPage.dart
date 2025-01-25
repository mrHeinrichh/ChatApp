import 'package:chatapp/CustomUI/OwnMessageCard.dart';
import 'package:chatapp/CustomUI/ReplyCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/MessageModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  IndividualPage({Key? key, this.chatModel, required this.sourceChat})
      : super(key: key);
  final chatModel;
  final ChatModel sourceChat;

  FocusNode focusNode = FocusNode();
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  IO.Socket? socket;
  bool showEmojiPicker = false;
  TextEditingController _controller = TextEditingController();
  String socketStatus = "Disconnected";
  bool sendButton = false;
  List<MessageModel> messages = [];
  @override
  void initState() {
    super.initState();
    connect();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          showEmojiPicker = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.0.110:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket!.onConnect((data) {
      print("Connected");
      setState(() {
        socketStatus = "Connected";
      });

      // Emit the sourceId to join the appropriate room on the server
      socket!.emit(
          "register",
          widget.sourceChat
              .id); // Assuming sourceChat.id is the unique user identifier

      socket!.on("message", (msg) {
        print("Received message: ${msg['message']}");
        if (msg['targetId'] == widget.sourceChat.id) {
          setMessage("destination", msg["message"]);
        }
      });
    });

    socket!.onConnectError((error) {
      print("Connection error: $error");
      setState(() {
        socketStatus = "Connection error: $error";
      });
    });

    socket!.onDisconnect((_) {
      print("Disconnected");
      setState(() {
        socketStatus = "Disconnected";
      });
    });

    socket!.connect();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket!.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
      message: message,
      type: type,
    );
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blueGrey,
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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: CircleAvatar(
                  //     radius: 20,
                  //     child: widget.chatModel.isGroup
                  //         ? const Icon(
                  //             Icons.group,
                  //             size: 38,
                  //           )
                  //         : const Icon(
                  //             Icons.person,
                  //             size: 38,
                  //           ),
                  //     backgroundColor: Colors.blueGrey,
                  //   ),
                  // ),
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
                        style: TextStyle(fontSize: 9),
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
                        const PopupMenuItem(
                            child: Text('Media, links, and docs')),
                        const PopupMenuItem(child: Text('Search')),
                        const PopupMenuItem(child: Text('Mute notifications')),
                        const PopupMenuItem(child: Text('Wallpaper')),
                        const PopupMenuItem(child: Text('More')),
                      ]),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 170,
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                            message: messages[index].message ?? "",
                          );
                        } else {
                          return ReplyCard(
                            message: messages[index].message ?? "",
                          );
                        }
                      },
                      shrinkWrap: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextField(
                            maxLines: 5,
                            minLines: 1,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  sendButton = true;
                                });
                              } else {
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            controller: _controller,
                            focusNode: widget.focusNode,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions),
                                onPressed: () {
                                  widget.focusNode.unfocus();
                                  widget.focusNode.canRequestFocus = false;
                                  setState(() {
                                    showEmojiPicker = !showEmojiPicker;
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => bottomsheet());
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.camera_alt),
                                    onPressed: () {},
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.green,
                                    child: IconButton(
                                      icon: sendButton
                                          ? const Icon(Icons.send)
                                          : const Icon(Icons.mic),
                                      onPressed: () {
                                        if (sendButton) {
                                          sendMessage(
                                              _controller.text,
                                              widget.sourceChat.id,
                                              widget.chatModel.id);
                                          _controller.clear();
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          showEmojiPicker ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (showEmojiPicker) {
                  setState(() {
                    showEmojiPicker = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomsheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Image'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.video_call),
            title: const Text('Video'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.insert_drive_file),
            title: const Text('Document'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.audio_file),
            title: const Text('Audio'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.gps_fixed_outlined),
            title: const Text('Location'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Contact'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
    );
  }
}
