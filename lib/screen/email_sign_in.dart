import 'package:counselling_app_project/widget/login_button.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
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
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 15,
                ),
                LoginButtons(
                  text: 'LOGIN',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an account?'),
                    FlatButton(onPressed: () {}, child: Text('Register')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
