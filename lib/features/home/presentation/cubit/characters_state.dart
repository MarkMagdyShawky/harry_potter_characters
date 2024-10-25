part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  const CharactersLoaded(this.characters);
}

class CharactersFailuer extends CharactersState {
  final String errMessage;

  CharactersFailuer({required this.errMessage});
}
