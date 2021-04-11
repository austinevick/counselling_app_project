import 'package:counselling_app_project/screen/detailed_screen.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:counselling_app_project/widget/search_bar.dart';
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            TextButton(
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Material(
                      child: ListTile(
                        selectedTileColor: Colors.green[100],
                        selected: isSelected,
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => DetailScreen())),
                        subtitle: Text('Cardiologist, University of Ibadan'),
                        title: Text('Christiana Arizona'),
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
              ),
            )
          ],
        ));
  }
}
