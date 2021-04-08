import 'package:counselling_app_project/model/chat.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final Chat chats;

  const Message({Key key, this.chats}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        chats.image == null
            ? Align(
                alignment:
                    chats.isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18),
                              topLeft: Radius.circular(18))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(chats.message),
                      ),
                    )))
            : Align(
                alignment:
                    chats.isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    chats.image,
                    height: 100,
                  ),
                )),
        Align(
            alignment:
                chats.isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(chats.time),
            )),
      ],
    ));
  }
}
