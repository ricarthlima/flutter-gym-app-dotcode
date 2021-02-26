import 'package:flutter/material.dart';
import 'package:gym_app/models/user_model.dart';
import 'package:gym_app/screens/home.dart';
import 'package:gym_app/screens/login_screen.dart';
import 'package:gym_app/screens/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
