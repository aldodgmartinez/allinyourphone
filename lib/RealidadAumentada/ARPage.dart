import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ARPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Pagina Para Realidad Aumentada"),
            RaisedButton(onPressed: (){
              //metodo para ir a la RA aqui
            },
            child: Text('Presioname para visitar la RA'),
            )
          ],),
      ),
    ); 
  }
}