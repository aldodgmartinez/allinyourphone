import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Cambias cuartos por la nueva clase
class Cuartos extends StatefulWidget{
  @override
  _Cuartos createState() => _Cuartos();
}

class _Cuartos extends State<Cuartos>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cuartos'),)
    );
  }
}