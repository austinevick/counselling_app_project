import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:flutter/material.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  EmailSignInFormType formType = EmailSignInFormType.signIn;
  String btnText() =>
      formType == EmailSignInFormType.signIn ? 'LOGIN' : 'REGISTER';
  String secondaryText() => formType == EmailSignInFormType.signIn
      ? 'Need an account? Register'
      : 'Have an account? Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) => !value.contains('@')
                      ? 'Please provide a valid email'
                      : null,
                  controller: emailController,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  style: TextStyle(fontSize: 22),
                  obscureText: true,
                  validator: (value) => value.length < 6
                      ? 'Character must be at least 6 length'
                      : null,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 15,
                ),
                LoginButtons(
                    text: btnText(),
                    onPressed: () {
                      if (formType == EmailSignInFormType.signIn) {
                        AuthenticationService.signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
                      } else {
                        AuthenticationService.createUserWithEmailAndPassword(
                            emailController.text, passwordController.text);
                      }
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        formType = formType == EmailSignInFormType.signIn
                            ? EmailSignInFormType.register
                            : EmailSignInFormType.signIn;
                        emailController.clear();
                        passwordController.clear();
                      });
                    },
                    child: Text(secondaryText()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
