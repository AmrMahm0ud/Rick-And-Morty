part of 'character_bloc.dart';

sealed class CharacterState {
  const CharacterState();
}

class CharacterInitial extends CharacterState {}

class CharacterShowSkeletonState extends CharacterState {}

class CharacterHideSkeletonState extends CharacterState {}

class SuccessGetCharacterState extends CharacterState {
  final List<Character> character;

  SuccessGetCharacterState({required this.character});
}

class FailGetCharacterState extends CharacterState {
  final String message;

  const FailGetCharacterState({required this.message});
}

class CharacterShowLoadingState extends CharacterState {}

class CharacterHideLoadingState extends CharacterState {}

class CharacterResetState extends CharacterState {}

class FailAddFavoriteCharacterState extends CharacterState {
  final String message;

  const FailAddFavoriteCharacterState({required this.message});
}

class FailUnFavoriteCharacterState extends CharacterState {
  final String message;

  const FailUnFavoriteCharacterState({required this.message});
}
