import 'package:counselling_app_project/model/chat.dart';
import 'package:counselling_app_project/widget/messages.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: chat.length,
                  itemBuilder: (context, index) {
                    final chats = chat[index];
                    return Message(
                      chats: chats,
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: messageController,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(fontSize: 18),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.send,
                      color: messageController.text.isEmpty
                          ? Colors.grey
                          : Colors.green,
                    ),
                    border: InputBorder.none,
                    hintText: 'Type message here'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
