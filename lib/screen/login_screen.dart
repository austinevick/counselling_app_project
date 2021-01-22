import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:flutter/material.dart';

import 'email_sign_in.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginButtons(
            onPressed: () => AuthenticationService.signInAnonymously(),
            text: 'Sign in anonymously',
          ),
          LoginButtons(
            onPressed: () => AuthenticationService.signInWithGoogle(),
            text: 'Sign in with Google',
          ),
          LoginButtons(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true, builder: (ctx) => EmailSignInPage())),
            text: 'Sign in with email',
          )
        ],
      ),
    );
  }
}
