import 'package:flutter/material.dart';
import 'package:yildizlar/src/core/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes,
      theme: ThemeData(fontFamily: 'Sora'),
      initialRoute: "home",
    );
  }
}