import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
            Center(child: CircleAvatar(radius: 60)),
            Center(child: Text('Victor A')),
          ],
        ),
      ),
    );
  }
}
