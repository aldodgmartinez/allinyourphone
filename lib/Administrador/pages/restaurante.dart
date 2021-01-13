import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Restaurante extends StatefulWidget {
  @override
  _Restaurante createState() => _Restaurante();
}

class _Restaurante extends State<Restaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Restaurante'),
        ],
      ),
    ));
  }
}
