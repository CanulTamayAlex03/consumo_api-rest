import 'package:api_rest/paginas/homePage.dart';
import 'package:flutter/material.dart';
import 'package:api_rest/models/producto.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Rest',
      home: homePage(),
    );
  }
}
