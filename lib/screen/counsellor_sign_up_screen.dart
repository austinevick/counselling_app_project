import 'package:counselling_app_project/widget/textfield.dart';
import 'package:flutter/material.dart';

class CounsellorSignUpScreen extends StatefulWidget {
  @override
  _CounsellorSignUpScreenState createState() => _CounsellorSignUpScreenState();
}

class _CounsellorSignUpScreenState extends State<CounsellorSignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final nationality = TextEditingController();
  final country = TextEditingController();
  final expertise = TextEditingController();
  final specialty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration form'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      TextInputField(
                        controller: fullName,
                        hintText: 'Full name',
                      ),
                      TextInputField(
                        controller: email,
                        hintText: 'Email',
                      ),
                      TextInputField(
                        controller: phoneNumber,
                        hintText: 'Phone number',
                      ),
                      TextInputField(
                        controller: nationality,
                        hintText: 'Nationality',
                      ),
                      TextInputField(
                        controller: expertise,
                        hintText: 'Years of experience',
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
