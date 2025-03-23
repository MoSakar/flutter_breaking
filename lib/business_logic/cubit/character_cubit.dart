import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/character.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  late CharacterRepository characterRepository;
   List<Character> characters=[];

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<Character> getCharacters() {
    characterRepository.getCharacters().then((caracters) {
      emit(Characterloaded(characters));
      this.characters = characters;
      print('...............................................................................');
      print(characters.toString());
    });
    return characters;
  }
}
