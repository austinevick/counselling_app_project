import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/exception_error_widget.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:counselling_app_project/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

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
  bool isLoading = false;
  User user;
  @override
  void dispose() {
    super.dispose();
  }

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
              obscureText: true,
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
              onPressed: () => submit(),
              text: 'LOGIN',
            ),
            // Text('Or Continue with'),
          ],
        ),
      ),
    );
  }

  submit() async {
    final dialog = ProgressDialog(context);
    try {
      if (formKey.currentState.validate()) {
        dialog.show();
        user = await AuthenticationService.signInWithEmailAndPassword(
            emailController.text, passwordController.text, context);
      }
      if (user != null) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(context, title: 'Sign in failed', exception: e);
    } finally {
      dialog.hide();
    }
  }
}
