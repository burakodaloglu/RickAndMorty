import 'package:flutter/material.dart';
import 'app/theme.dart';

void main ()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: Text("Material App Bar"),),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
