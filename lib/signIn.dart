import 'package:AIYP/RealidadAumentada/ARPage.dart';
import 'package:AIYP/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('All in your phone'),),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "Contraseña"),
          ),
          RaisedButton(
            onPressed: (){
              context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim()
                );
            },
            child: Text('Iniciar Sesion'),
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RaisedButton(
            onPressed: (){
              context.read<AuthenticationService>().singInAnonymous();
            },
            child: Text('Soy Huesped'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => ARPage()));
            },
            child: Text('R.A'),
          ),
          ],),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    image: const DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/aiyp-4b813.appspot.com/o/Screenshot%20from%202021-01-12%2020-54-05.png?alt=media&token=c345c7c2-7f99-49ae-803a-d782acb69e09'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
