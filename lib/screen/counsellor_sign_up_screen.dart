import 'package:counselling_app_project/widget/textfield.dart';
import 'package:flutter/material.dart';

class CounsellorSignUpScreen extends StatefulWidget {
  @override
  _CounsellorSignUpScreenState createState() => _CounsellorSignUpScreenState();
}

class _CounsellorSignUpScreenState extends State<CounsellorSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration form'),
      ),
      body: Container(
        child: Form(
            child: Column(
          children: [
            TextInputField(),
            TextInputField(),
            TextInputField(),
            TextInputField(),
            TextInputField(),
          ],
        )),
      ),
    );
  }
}
