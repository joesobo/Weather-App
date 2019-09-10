import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        backgroundColor: Colors.transparent,
        canvasColor: Colors.white.withOpacity(0.5)
      ),
      home: HomePage(),
    );
  }
}