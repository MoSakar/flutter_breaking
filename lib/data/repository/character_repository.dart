import 'package:flutter_breaking/data/models/character.dart';
import 'package:flutter_breaking/data/web_services/characters_webservices.dart';

class CharacterRepository {
final CharacterWebServices characterWebServices ;

  CharacterRepository(this.characterWebServices);
  Future <List<dynamic>> getCharacters() async{
    final characters = await characterWebServices.getCharacters();
    return characters.map((character)=>Character.fromJson(character)).toList();

  }
  

}