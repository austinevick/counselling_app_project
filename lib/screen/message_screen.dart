import 'package:counselling_app_project/model/chat.dart';
import 'package:counselling_app_project/widget/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final messageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
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
            buildInputField()
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() => PreferredSize(
      child: SafeArea(
        child: Container(
          height: 55,
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('images/img2.jpg'),
                    )
                  ],
                ),
              ),
            ],
          ),
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
      preferredSize: Size(60, 60));

  Widget buildInputField() => Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.image), onPressed: () {}),
              Expanded(
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
                      border: InputBorder.none, hintText: 'Type message here'),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: messageController.text.isEmpty
                        ? Colors.grey
                        : Colors.green,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      );
}
