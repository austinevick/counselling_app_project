import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling_app_project/model/therapist.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:counselling_app_project/widget/exception_error_widget.dart';
import 'package:counselling_app_project/widget/progress_dialog.dart';
import 'package:counselling_app_project/widget/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  var gender = ['Male', 'Female', 'Other'];
  String? initialValue = 'Male';
  Therapist? therapist;
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
                        hintText: 'Full name*',
                        textCapitalization: TextCapitalization.words,
                        validator: (value) => value.isEmpty ? 'Required' : null,
                      ),
                      TextInputField(
                        controller: email,
                        hintText: 'Email Address*',
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) => !value.contains('@')
                            ? 'Please provide a valid email'
                            : null,
                      ),
                      TextInputField(
                        controller: phoneNumber,
                        hintText: 'Phone number*',
                        textInputType: TextInputType.phone,
                        validator: (value) => validateMobile(value),
                      ),
                      TextInputField(
                        validator: (value) => value == null ? 'Required' : null,
                        controller: nationality,
                        hintText: 'Nationality*',
                      ),
                      TextInputField(
                        validator: (value) => value == null ? 'Required' : null,
                        controller: specialty,
                        hintText: 'Specialty (e.g Dermatologist)*',
                      ),
                      TextInputField(
                        validator: (value) => value == null ? 'Required' : null,
                        controller: expertise,
                        textInputType: TextInputType.number,
                        hintText: 'Years of experience*',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Gender'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DropdownButtonFormField(
                          value: initialValue,
                          onChanged: (dynamic value) =>
                              setState(() => initialValue = value),
                          items: gender
                              .map((items) => DropdownMenuItem(
                                  value: items, child: Text(items)))
                              .toList(),
                          validator: (dynamic value) => value == null
                              ? 'Please fill in your gender'
                              : null,
                        ),
                      )
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
                          onPressed: () => submit(),
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

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  submit() async {
    final dialog = ProgressDialog(context);
    dialog.style(
        message: 'Please wait...',
        child: Center(child: SpinKitDoubleBounce(color: Colors.green)));
    try {
      if (formKey.currentState!.validate()) {
        dialog.show();
        formKey.currentState!.save();
        therapist = new Therapist(
          fullName: fullName.text,
          emailAddress: email.text,
          phoneNumber: phoneNumber.text,
          nationality: nationality.text,
          specialty: specialty.text,
          dateJoined: Timestamp.now(),
          experienceLength: expertise.text,
        );
        await FirestoreDatabase.saveTherapistsData(therapist!);
      }
      if (therapist != null) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(context,
          title: 'Registration failed please try again', exception: e);
    } finally {
      dialog.hide();
    }
  }
}
