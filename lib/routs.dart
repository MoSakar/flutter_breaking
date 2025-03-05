import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/presentation/screens/character_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case characterScreenRoute:
        return MaterialPageRoute(builder: (_) =>  CharacterScreen());
    }
  }
  
 
}