import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/pages/cartPage.dart';
import 'package:hava_havai/pages/cataloguePage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
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
