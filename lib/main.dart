import 'package:flutter/material.dart';
import 'package:gym_app/pages/learn_firebase.dart';
import 'package:gym_app/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      home: LearnFirebase(),
      debugShowCheckedModeBanner: false,
    );
  }
}
