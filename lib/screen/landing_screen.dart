import 'package:counselling_app_project/screen/signin_screen.dart';
import 'package:counselling_app_project/screen/signup_screen.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///backgroundColor: Colors.green[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'COUNSELLO',
            style: TextStyle(fontSize: 35),
          ),
          Image.asset(
            'images/img1.png',
            height: 300,
            width: 300,
          ),
          LoginButtons(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SignInScreen())),
            text: 'SIGN IN',
          ),
          LoginButtons(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SignupScreen())),
            text: 'SIGN UP',
          ),
        ],
      ),
    );
  }
}