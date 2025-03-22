part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterState {}

class FavoriteCharacterInitial extends FavoriteCharacterState {}

class SuccessGetFavoriteCharacterState extends FavoriteCharacterState {
  final List<Character> character;

  SuccessGetFavoriteCharacterState({required this.character});
}

class UpdateFavoriteCharacterScreenState extends FavoriteCharacterState {
  final List<Character> character;

  UpdateFavoriteCharacterScreenState({required this.character});
}

class FavoriteCharacterShowSkeletonState extends FavoriteCharacterState {}

class FavoriteCharacterHideSkeletonState extends FavoriteCharacterState {}
