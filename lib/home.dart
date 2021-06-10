import 'package:flutter/material.dart';
import 'package:login/login.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
        Center(child: Text("🥳",style: TextStyle(fontSize: 40,),)),
        SizedBox(height: 20,),
            Center(child: Text("You Have Successfully Logged In",style: TextStyle(fontSize: 16,),)),
            SizedBox(height: 20,),
            Center(child: RaisedButton(
              color: Colors.redAccent,
              
               onPressed: (){
                 Navigator.pop(context);

            },child: Text("Logout Here",style: TextStyle(fontSize: 16,color: Colors.white),)))
          ],),
        ),
      ),
    );
  }
}