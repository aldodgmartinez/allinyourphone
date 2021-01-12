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
      body: Column(children: [
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
          child: Text('Sign in'),
        ),
        RaisedButton(
          onPressed: (){
            context.read<AuthenticationService>().singInAnonymous();
          },
          child: Text('Sign in Anonymously'),
        ),
        RaisedButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ARPage()));
          },
          child: Text('Realidad Aumentada'),
        ),
      ],
      ),
    );
  }
}
