import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:counselling_app_project/widget/textfield.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = new GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Account'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              controller: passwordController,
              prefixIcon: Icon(Icons.lock_outline),
              hintText: 'Enter your password',
              validator: (value) =>
                  value.length < 6 ? 'Character must be 6 length' : null,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text('Forgot Password'),
                onPressed: () {},
              ),
            ),
            LoginButtons(
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  await AuthenticationService.signInWithEmailAndPassword(
                      emailController.text, passwordController.text, context);
                }
              },
              text: 'LOGIN',
            ),
            // Text('Or Continue with'),
          ],
        ),
      ),
    );
  }
}
