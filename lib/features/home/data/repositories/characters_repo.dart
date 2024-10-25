import '../models/character.dart';

abstract class CharactersRepo {
  Future<List<Character>> getAllCharacters();
}
