import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game.dart';
import 'package:tictactoe/screens/playerchoosing.dart';
import 'package:tictactoe/screens/spalshScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // '/': (BuildContext context) =>   MyApp(),
  SplashScreen.routeName: (BuildContext context) => SplashScreen(),
  PlayerChoosing.routeName: (BuildContext context) => PlayerChoosing(),
  Game.routeName: (BuildContext context) => Game(),
};
