import 'package:flutter/material.dart';
import 'package:omcat20/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.teal),
      home: Home(),
    );
  }
}
