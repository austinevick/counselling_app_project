import 'package:counselling_app_project/services/authentication.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AuthenticationService.currentUser.email),
        actions: [
          FlatButton(
            child: Text('Sign Out'),
            onPressed: () => AuthenticationService.signOut(),
          )
        ],
      ),
      body: Center(),
    );
  }
}
