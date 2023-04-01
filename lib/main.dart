
import 'package:flutter/material.dart';
import 'package:new_code_wid_f/splash_screen.dart';
import 'package:flutter/services.dart';
//import 'dart:ui';
//import 'dart:async';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}

