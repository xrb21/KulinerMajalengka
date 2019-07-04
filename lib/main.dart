import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/pages/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner Majelngka',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashPage(),
    );
  }
}

