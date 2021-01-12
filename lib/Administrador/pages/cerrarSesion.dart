import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CerrarSesion extends StatefulWidget{
  @override
  _CerrarSesion createState() => _CerrarSesion();
}

class _CerrarSesion extends State<CerrarSesion>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cerrar Sesion'),)
    );
  }
}