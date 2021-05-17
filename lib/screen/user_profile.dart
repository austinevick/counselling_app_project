import 'package:counselling_app_project/services/authentication.dart';
import 'package:flutter/material.dart';

import 'counsellor_sign_up_screen.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop()),
            Center(child: CircleAvatar(radius: 60)),
            Center(child: Text('Victor A')),
            Center(child: Text('victor@gmail.com')),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                AuthenticationService.signOut();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Become a therapist'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => CounsellorSignUpScreen())),
            )
          ],
        ),
      ),
    );
  }
}
