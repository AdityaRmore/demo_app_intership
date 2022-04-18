import 'dart:convert';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class student{
  String baseurl ="";

  Future<List> getallstudents() async {
    try{
      var response = await http.get(Uri.parse(baseurl));
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch(e){
      return Future.error(e);
    }
  }

}