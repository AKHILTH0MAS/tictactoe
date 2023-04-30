import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game.dart';
import 'package:tictactoe/screens/playerchoosing.dart';
import 'package:tictactoe/screens/spalshScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // '/': (BuildContext context) => const MyApp(),
  SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
  PlayerChoosing.routeName: (BuildContext context) => const PlayerChoosing(),
  Game.routeName: (BuildContext context) => const Game(),
};
