import 'package:counselling_app_project/widget/login_button.dart';
import 'package:counselling_app_project/widget/textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final phoneController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInputField(
            controller: nameController,
            prefixIcon: Icon(Icons.person_outline),
            hintText: 'Enter your full name',
            validator: (value) =>
                value.isEmpty ? 'Please enter your name' : null,
          ),
          TextInputField(
            textInputType: TextInputType.emailAddress,
            controller: emailController,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'Enter your email',
            validator: (value) => !value.contains('@') && !value.contains('.')
                ? 'Please enter a valid email'
                : null,
          ),
          TextInputField(
            prefixIcon: Icon(Icons.phone_outlined),
            validator: (value) => validateMobile(value),
            autofillHints: [AutofillHints.telephoneNumber],
            controller: phoneController,
            hintText: 'Phone Number* ',
            textInputType: TextInputType.phone,
          ),
          TextInputField(
            controller: passwordController,
            prefixIcon: Icon(Icons.lock_outline),
            hintText: 'Enter your password',
            validator: (value) =>
                value.length < 6 ? 'Character must be 6 length' : null,
          ),
          SizedBox(
            height: 20,
          ),
          LoginButtons(
            onPressed: () {},
            text: 'SIGN UP',
          ),
          // Text('Or Continue with'),
        ],
      ),
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
