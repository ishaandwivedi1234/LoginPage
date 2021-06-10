import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:login/home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  login(BuildContext context) async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      setState(() {
        loading = true;
      });
      Map<String, dynamic> _body = {
        "email": _emailController.text.trim(),
        "password": _passController.text.trim(),
        "deviceId": "testString"
      };

      var jsonBody = jsonEncode(_body);

      print(_body);
      var url = Uri.parse('https://bmkauth.herokuapp.com/api/v1/user/singin');

      var response = await http.post(url,
          body: jsonBody, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Invalid Login Details '),
          backgroundColor: Colors.red[400],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _emailController,
                  validator: (val) {
                    if (val!.isEmpty) return "Please Enter Your Email ";
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    ),
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your Password",
                    prefixIcon: Icon(Icons.lock_outlined, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.3),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) return "Please Enter Your Password ";
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: loading ? null : () => login(context),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                color: Colors.redAccent,
              ),
              SizedBox(
                height: 30,
              ),
              if (loading)
                SpinKitFadingFour(
                  color: Colors.red,
                  size: 50.0,
                )
            ],
          )),
    );
  }
}

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi 👋",
            style: TextStyle(
                fontSize: 30,
                color: Colors.red[600],
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Text("Welcome Back , Let's Login",
              style: TextStyle(fontSize: 24, color: Colors.grey[700])),
        
        SizedBox(height:10)
        ],
      ),
    );
  }
}
