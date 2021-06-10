import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(primaryColor: Colors.red,accentColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Login(),

    );
  }
}
