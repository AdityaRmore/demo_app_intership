import 'package:demo_app_intership/student.dart';
import 'package:flutter/material.dart';

class retriveJson extends StatefulWidget {
  const retriveJson({Key? key}) : super(key: key);

  @override
  State<retriveJson> createState() => _retriveJsonState();
}

class _retriveJsonState extends State<retriveJson> {
  student s = student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List>(
            future: s.getallstudents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text('Name'),
                          subtitle: Text('Email'),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: Text("No Data"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
