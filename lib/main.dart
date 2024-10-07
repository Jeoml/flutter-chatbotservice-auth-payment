import 'package:flutter/material.dart';
import 'widgets/dotted_background.dart'; // Adjust the path accordingly

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DottedBackground(
        ),
         // Use the DottedBackground widget
      ),
    );
  }
}
