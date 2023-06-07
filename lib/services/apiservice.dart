import 'dart:convert';

import 'package:flutter/material.dart';

 import 'package:http/http.dart' as http;
class ApiService {
  //login
  login(var body) async {
    debugPrint('logging in');
    debugPrint(body.toString());
    try {
      var res = await http.post(
        Uri.parse('https://reqres.in/api/login'),
      
        body: body,
      );
      var jsonData = jsonDecode(res.body);
      debugPrint(res.body);

      if (res.statusCode == 200 || res.statusCode==404) {
        debugPrint('logged in');
        print(jsonData);
        return jsonDecode(res.body);
      } else {
        debugPrint('error logging in');
        debugPrint(res.body);
        return null;
      }
    } catch (e) {
      debugPrint('error logging in: $e');
      return null;
    }
  }
}