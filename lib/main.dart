import 'package:flutter/material.dart';
import 'package:flutterchatbot/auth/login_or_register.dart';
import 'package:flutterchatbot/pages/login_page.dart';
import 'package:flutterchatbot/pages/register_page.dart';
import 'package:flutterchatbot/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: DottedBackground(
      //   ),
      //    // Use the DottedBackground widget
      // ),
      home: LoginOrRegister(),
      // theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}