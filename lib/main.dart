import 'package:flutter/material.dart';
import 'package:rickandmortyapp/screens/home_screen.dart';
import 'package:rickandmortyapp/utilities/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kAppColor,
        scaffoldBackgroundColor: kAppColor,
      ),
      home: HomeScreen(),
    );
  }
}
