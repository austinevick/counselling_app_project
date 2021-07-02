import 'package:counselling_app_project/model/user.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'counsellor_sign_up_screen.dart';

class UserProfile extends StatelessWidget {
  static User? user = AuthenticationService.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<Users>>(
            stream: FirestoreDatabase.fetchusersData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop()),
                  Center(child: CircleAvatar(radius: 60)),
                  Center(child: Text(user!.displayName!)),
                  Center(child: Text(user!.email!)),
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
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (ctx) => CounsellorSignUpScreen())),
                  )
                ],
              );
            }),
      ),
    );
  }
}
