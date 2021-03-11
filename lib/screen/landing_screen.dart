import 'dart:async';

import 'package:counselling_app_project/screen/signin_screen.dart';
import 'package:counselling_app_project/screen/signup_screen.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    Timer(Duration(milliseconds: 800), () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///backgroundColor: Colors.green[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'COUNSELLO',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          Text(
            'A place to meet your online counsellors',
            style: TextStyle(fontSize: 15),
          ),
          SlideTransition(
            position: Tween(
              begin: Offset(-1, 0),
              end: Offset(0, 0),
            ).animate(_animationController),
            child: FadeTransition(
              opacity: _animationController,
              child: Image.asset(
                'images/img1.png',
                height: 300,
                width: 300,
              ),
            ),
          ),
          SlideTransition(
            position: Tween(
              begin: Offset(0, 1),
              end: Offset(0, 0),
            ).animate(_animationController),
            child: LoginButtons(
              onPressed: () => null,
              text: 'REGISTER AS A COUNSELLOR',
            ),
          ),
          SlideTransition(
            position: Tween(
              begin: Offset(0, 1),
              end: Offset(0, 0),
            ).animate(_animationController),
            child: LoginButtons(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SignInScreen())),
              text: 'SIGN IN',
            ),
          ),
          SlideTransition(
            position: Tween(
              begin: Offset(0, 1),
              end: Offset(0, 0),
            ).animate(_animationController),
            child: LoginButtons(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SignupScreen())),
              text: 'SIGN UP',
            ),
          ),
        ],
      ),
    );
  }
}
