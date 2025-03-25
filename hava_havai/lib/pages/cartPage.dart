import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color.fromARGB(255, 255, 213, 227),
      ),
    );
  }
}
