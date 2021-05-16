import 'package:counselling_app_project/screen/chats_screen.dart';
import 'package:counselling_app_project/screen/user_profile.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/search_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
              onDoubleTap: () => AuthenticationService.signOut(),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  radius: 18,
                ),
              ),
            ),
            Expanded(child: SearchBarWidget()),
            IconButton(
                icon: Icon(Icons.message, color: Colors.white),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ))),
          ],
        ),
      ),
    );
  }
}
