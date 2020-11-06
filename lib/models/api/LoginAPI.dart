import 'dart:convert';

import 'package:flutter_app/models/model/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/url_constants.dart';

class LoginAPI {
  login(String username, String password) async {
    final response = await http.post("$main_url$login_url",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{"username": username, "password": password}));

    return (response.statusCode == 200)
        ? LoginResponse.fromJson(json.decode(response.body))
        : null;
  }
}
