import 'package:book_donation/theme/routes.dart';
import 'package:flutter/material.dart';
import 'package:book_donation/views/opening_screen.dart';
import 'package:book_donation/theme/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opening View Demo',
      routes: AppRoutes.define(),
      home: OpeningView(),
    );
  }
}

