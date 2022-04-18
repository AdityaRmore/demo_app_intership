// ignore_for_file: equal_elements_in_set

import 'package:demo_app_intership/task2/AddFields.dart';
import 'package:flutter/material.dart';

class HomeTask2 extends StatefulWidget {
  const HomeTask2({Key? key}) : super(key: key);

  @override
  _HomeTask2State createState() => _HomeTask2State();
}

class _HomeTask2State extends State<HomeTask2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: dates.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dates.elementAt(index)),
                      )),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        height: 60,
        child: Center(
          child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddFields()));
              },
              icon: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

Set<String> dates = {
  "12-02-2020",
  "23-04-2020",
  "08-05-2020",
  "18-06-2020",
  "29-08-2020",
};
