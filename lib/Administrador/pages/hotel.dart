import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Hotel extends StatefulWidget {
  @override
  _Hotel createState() => _Hotel();
}

class _Hotel extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hotel'),
        ],
      ),
    ));
  }
}
