import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../authentication_service.dart';
import 'package:provider/provider.dart';

class CerrarSesion extends StatefulWidget {
  @override
  _CerrarSesion createState() => _CerrarSesion();
}

class _CerrarSesion extends State<CerrarSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cerrar Sesion'),
          RaisedButton(onPressed: () {
            context.read<AuthenticationService>().signOut();
          }),
        ],
      ),
    ));
  }
}
