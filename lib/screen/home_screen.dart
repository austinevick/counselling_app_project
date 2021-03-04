import 'package:counselling_app_project/model/job.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            FlatButton(
              child: Text('Sign Out'),
              onPressed: () => AuthenticationService.signOut(),
            )
          ],
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await FirebaseDatabase.addItems(
                Job(name: 'Engineer', ratePerHour: 24));
          },
          child: Icon(Icons.add),
        ));
  }

  addJob(BuildContext context) async {
    try {
      await FirebaseDatabase.addItems(Job(name: 'Engineer', ratePerHour: 24));
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Operation failed',
              ),
              content: Text(e.message),
            );
          });
    }
  }
}
