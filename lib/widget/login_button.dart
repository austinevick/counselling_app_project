import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final Color? color;

  const LoginButtons({Key? key, this.color, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: color ?? Color(0xff209f84),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
                onPressed: onPressed as void Function()?,
                child: Text(
                  text!,
                  style: TextStyle(color: Colors.white),
                ))));
  }
}
