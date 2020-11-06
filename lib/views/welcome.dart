import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/image_constants.dart';
// import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/login.dart';

class WelcomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeState();
}

class WelcomeState extends State<WelcomeApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
        () async => {
              Navigator.of(context).pushAndRemoveUntil(
                  // MaterialPageRoute(builder: (context) => HomeApp()),
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false)
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(welcome_background))),
      child: Image.asset(welcome_icon_test),
    );
  }
}
