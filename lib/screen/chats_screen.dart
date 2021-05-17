import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
      ),
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Center(
        child: Text('No chats yet'),
      ),
    );
  }
}
