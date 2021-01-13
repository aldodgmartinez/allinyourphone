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
          Text("Instituto Tecnologico de Toluca",style: Theme.of(context).textTheme.subtitle1,),
          Text("Ing. en Sistemas Computacionales",style: Theme.of(context).textTheme.subtitle1,),
          Text("Progamacion A. Desarrollo Movil",style: Theme.of(context).textTheme.subtitle1,),
          SizedBox(height: 38,),
          Text("All in your phone",style: Theme.of(context).textTheme.headline4,),
          SizedBox(height: 18,),
          Text("Presenta: ",style: Theme.of(context).textTheme.headline6,),
          Text("Guillermo Martinez Aldo Daniel: 16280572",style: Theme.of(context).textTheme.subtitle1,),
          Text("Serna Segura Fernanda Ivonne: 16280580",style: Theme.of(context).textTheme.subtitle1,),
          Text("García Tapia Diego David: 15280793",style: Theme.of(context).textTheme.subtitle1,),
          SizedBox(height: 18,),
          Text("Docente:",style: Theme.of(context).textTheme.headline6,),
          Text("M. en C. Rocio Elizabeth Pulido Alba",style: Theme.of(context).textTheme.subtitle1,),
          Text("13 de Enero del 2021",style: Theme.of(context).textTheme.bodyText1,),
          Text("Metepec, Edo. de Méx.",style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 58,),
          RaisedButton( child: Text("Cerrar Sesion"), onPressed: () {
            context.read<AuthenticationService>().signOut();
          }),
        ],
      ),
    ));
  }
}
