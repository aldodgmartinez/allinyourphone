import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Restaurante extends StatefulWidget {
  @override
  _Restaurante createState() => _Restaurante();
}

class _Restaurante extends State<Restaurante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
          initialUrl: "https://aldodgmartinez.github.io/menuISSEMyM-VB/",
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}
