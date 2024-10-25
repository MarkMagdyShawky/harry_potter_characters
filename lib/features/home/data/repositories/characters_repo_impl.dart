import '../../../../core/api/api_services.dart';
import '../models/character.dart';
import 'characters_repo.dart';

class CharactersRepoImpl implements CharactersRepo {
  final ApiServices apiServices;

  CharactersRepoImpl({required this.apiServices});

  @override
  Future<List<Character>> getAllCharacters() async {
    final List<dynamic> characters = await apiServices.getAllCharacters();
    // characters.forEach((characters) => print('Character from Repo: ${characters}'));
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
