import 'package:flutter/material.dart';
import 'package:flutter_breaking/business_logic/cubit/character_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:flutter_breaking/data/web_services/characters_webservices.dart';
import 'package:flutter_breaking/presentation/screens/character_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;
  AppRoute() {
    characterRepository = CharacterRepository(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreenRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>characterCubit ,
          child:CharacterScreen(),
        )
        );
    }
  }
}
