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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.green[600]));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeCare',
        theme: ThemeData(
            accentColor: Colors.green,
            primaryColor: Colors.green,
            appBarTheme: AppBarTheme(color: Colors.green)),
        home: AuthenticationScreen());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getPercentage();
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (c, i) {
                return Card(child: Text(tasks[i].name!));
              }),
        ),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(value: value),
          ),
        )
      ],
    )));
  }
}

var value = 0.0;
getPercentage() {
  var p = tasks.where((element) => element.isDone == true).toList().length /
      tasks.length *
      100;
  value = p / 100;
  print(p.floor());
}

List<Task> tasks = [
  Task(name: 'Go to Market', isDone: false),
  Task(name: 'Go to church', isDone: false),
  Task(name: 'sleep', isDone: true),
  Task(name: 'Play', isDone: true),
  Task(name: 'Go shopping', isDone: true),
];

class Task {
  final String? name;
  final bool? isDone;

  Task({this.name, this.isDone});
}
