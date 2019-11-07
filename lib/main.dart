import 'package:api_teste123/login-page.dart';
import 'package:api_teste123/produtos-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Produtos(),
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      
      ),
      
    );
  }
}

