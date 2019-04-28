import 'package:flutter/material.dart';
import 'package:pokemon_app/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon App",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MainPage(),
    );
  }
}