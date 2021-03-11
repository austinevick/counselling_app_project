import 'package:counselling_app_project/model/job.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:counselling_app_project/widget/search_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// UI url: https://www.behance.net/gallery/112706811/Dentist-Doctor-Consultant-Mobile-App-Ui-Kit?tracking_source=search_projects_recommended%7Cappointment%20booking

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            FlatButton(
              child: Text('Sign Out'),
              onPressed: () => AuthenticationService.signOut(),
            )
          ],
        ),
        body: Column(
          children: [
            SearchBarWidget(),
            Text('Therapists'),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      child: Text('hgf'),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
