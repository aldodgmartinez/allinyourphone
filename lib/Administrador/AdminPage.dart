import 'package:AIYP/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Pagina de administrador"),
            RaisedButton(onPressed: (){context.read<AuthenticationService>().signOut();},)
          ],),
      ),
    ); 
  }
}