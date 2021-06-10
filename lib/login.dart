import 'package:flutter/material.dart';
import 'package:login/loginForm.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login"),),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: AppTitle()),
          SizedBox(height:30,),
          Container(child: LoginForm()),
        ],
      ),
    );
  }
}


