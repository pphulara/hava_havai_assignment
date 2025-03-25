import 'package:flutter/material.dart';

class Cataloguepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _cataloguePageState();
  }
}

class _cataloguePageState extends State<Cataloguepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 213, 227),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'cart');
            },
            icon: Icon(Icons.trolley),
          ),
        ],
      ),
    );
  }
}
