// ignore_for_file: deprecated_member_use

import 'package:demo_app_intership/task1/jsonexport.dart';
import 'package:demo_app_intership/task2/home.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("Task 1"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => JsonExport()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeTask2()));
                },
                child: Text("Task 2"),
              ),
              // SizedBox(
              //   height: 20,
              // ),

              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: (){

                },
                child: Text("Group 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
