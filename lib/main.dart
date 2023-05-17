import 'package:flutter/material.dart';
import 'package:tictactoe/routes.dart';
import 'package:tictactoe/screens/spalshScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
