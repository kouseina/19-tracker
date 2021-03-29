import 'package:flutter/material.dart';

class NointernetPage extends StatefulWidget {
  @override
  _NointernetPageState createState() => _NointernetPageState();
}

class _NointernetPageState extends State<NointernetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Please check your Internet',
          style: TextStyle(fontSize: 27),
        ),
      ),
    );
  }
}
