import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue[300],
        ),
        body: const Center(
          child: Text(
            "W E L C O M E",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
