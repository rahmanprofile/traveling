import 'package:flutter/material.dart';

import 'View/BottomNavigationBar/navBar.dart';
import 'View/Pages/homePage.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(),
      theme: ThemeData(fontFamily: 'Questrial'),
    );
  }
}