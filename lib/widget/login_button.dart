import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LoginButtons({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff1b80e4),
                borderRadius: BorderRadius.circular(10)),
            child: FlatButton(onPressed: onPressed, child: Text(text))));
  }
}
