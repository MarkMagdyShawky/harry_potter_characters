import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/character.dart';
import '../../data/repositories/characters_repo_impl.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepoImpl) : super(CharactersInitial());
  final CharactersRepoImpl charactersRepoImpl;
  List<Character> characters = [];

  List<Character> getAllCharacters() {
    emit(CharactersLoading());

    charactersRepoImpl.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;

      // characters.forEach((character) => print('Character From Cubit: ${character}'));
    });
    return characters;
  }
}
