import 'package:counselling_app_project/model/user.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:counselling_app_project/widget/exception_error_widget.dart';
import 'package:counselling_app_project/widget/login_button.dart';
import 'package:counselling_app_project/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = new GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final phoneController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
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
        title: Text('Create Account'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInputField(
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(emailFocusNode);
              },
              controller: nameController,
              prefixIcon: Icon(Icons.person_outline),
              hintText: 'Enter your full name',
              validator: (value) =>
                  value.isEmpty ? 'Please enter your name' : null,
            ),
            TextInputField(
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(phoneFocusNode);
              },
              focusNode: emailFocusNode,
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'Enter your email',
              validator: (value) => !value.contains('@') && !value.contains('.')
                  ? 'Please enter a valid email'
                  : null,
            ),
            TextInputField(
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              focusNode: phoneFocusNode,
              prefixIcon: Icon(Icons.phone_outlined),
              validator: (value) => validateMobile(value),
              autofillHints: [AutofillHints.telephoneNumber],
              controller: phoneController,
              hintText: 'Phone Number',
              textInputType: TextInputType.phone,
            ),
            TextInputField(
              obscureText: true,
              focusNode: passwordFocusNode,
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
              onPressed: () => submit(),
              text: 'SIGN UP',
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
        formKey.currentState.save();
        user = await AuthenticationService.createUserWithEmailAndPassword(
            emailController.text, passwordController.text);
        final userData = new Users(
            phoneNumber: phoneController.text,
            userRole: 'user',
            userName: nameController.text,
            email: emailController.text);
        await FirestoreDatabase.saveUsersData(userData);
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

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
