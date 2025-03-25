import 'package:flutter/material.dart';
import 'package:hava_havai/pages/cartPage.dart';
import 'package:hava_havai/pages/cataloguePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cataloguepage(),
      routes: {
        'home': (context) => Cataloguepage(),
        'cart': (context) => Cartpage(),
      },
    );
  }
}
