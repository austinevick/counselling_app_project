import 'package:counselling_app_project/screen/home_screen.dart';
import 'package:counselling_app_project/screen/login_screen.dart';
import 'package:counselling_app_project/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counsel and therapy',
        theme: ThemeData.dark(),
        home: WelcomeScreen());
  }
}
