import 'package:flutter_breaking/data/models/character.dart';
import 'package:flutter_breaking/data/web_services/characters_webservices.dart';

class CharacterRepository {
final CharacterWebServices characterWebServices ;

  CharacterRepository(this.characterWebServices);
  Future <List<Character>> getCharacters() async{
    final characters = await characterWebServices.getCharacters();
    print('1111111111111111111111111111111111111111111111111111111111111111');
     print(characters.toString());
    // print(characters.map((character) => Character.fromJson(character)).toList());
    // return characters.map((character) => Character.fromJson(character)).toList();

      if (characters.isNotEmpty) { // Ensure it's not empty before mapping
      print(characters.map((character) => Character.fromJson(character)).toList()); 
    return characters.map((character) => Character.fromJson(character)).toList();
  } else {
    print("Error: No characters found in API response.");
    return [];
  }

  }
  

}