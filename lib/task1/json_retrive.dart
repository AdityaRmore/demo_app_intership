import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonRetrive extends StatefulWidget {
  const JsonRetrive({Key? key}) : super(key: key);

  @override
  _JsonRetriveState createState() => _JsonRetriveState();
}

class _JsonRetriveState extends State<JsonRetrive> {

  Future getData() async {
    // var responce = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var jsondata = jsonDecode(responce.body);
    List<User> users = [];
    for (var u in jsondata) {
      User user = new User(u['name'], u['email'], u['username']);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              } else {
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                  );
                }, itemCount: snapshot.data.length);
              }
            },
          ),
        ),
      ),
    );
  }
}

class User {
  final String name, email, username;

  User(this.name, this.email, this.username);


}
