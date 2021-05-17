import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling_app_project/model/therapist.dart';
import 'package:counselling_app_project/screen/counsellor_sign_up_screen.dart';
import 'package:counselling_app_project/screen/detailed_screen.dart';
import 'package:counselling_app_project/services/firestore_service.dart';
import 'package:counselling_app_project/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

// UI url: https://www.behance.net/gallery/112706811/Dentist-Doctor-Consultant-Mobile-App-Ui-Kit?tracking_source=search_projects_recommended%7Cappointment%20booking

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollcontroller = new ScrollController();
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => CounsellorSignUpScreen())),
                  child: CustomAppBar()),
              preferredSize: Size(60, 60)),
          body: Column(
            children: [
              new Expanded(
                child: StreamBuilder<List<Therapist>>(
                    stream: FirestoreDatabase.fetchTherapists(),
                    builder: (ctx, snapshot) {
                      if (snapshot.data == null)
                        return Center(child: CircularProgressIndicator());
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Material(
                              child: ListTile(
                                selectedTileColor: Colors.green[100],
                                selected: isSelected,
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) => new DetailScreen())),
                                subtitle:
                                    Text(snapshot.data[index].specialty ?? ''),
                                title:
                                    Text(snapshot.data[index].fullName ?? ''),
                                leading: Container(
                                    color: Colors.pink,
                                    child: Image.asset(
                                      'images/img2.jpg',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              )
            ],
          )),
    );
  }
}
