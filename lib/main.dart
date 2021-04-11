import 'package:counselling_app_project/screen/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.green[600]));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counsel and therapy',
        theme: ThemeData(
            primaryColor: Colors.green,
            appBarTheme: AppBarTheme(color: Colors.green)),
        home: AuthenticationScreen());
  }
}
