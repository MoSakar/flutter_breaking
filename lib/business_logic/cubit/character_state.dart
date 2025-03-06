part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
class Characterloaded extends CharacterState {
  final List<Character> characters;
  Characterloaded(this.characters);
}
