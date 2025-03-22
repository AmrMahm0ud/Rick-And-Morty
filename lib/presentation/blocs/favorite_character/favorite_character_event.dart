part of 'favorite_character_bloc.dart';

@immutable
abstract class FavoriteCharacterEvent {}

class GetFavoriteCharacterEvent extends FavoriteCharacterEvent {}

class UnFavoriteCharacterEvent extends FavoriteCharacterEvent {
  final int characterId;

  UnFavoriteCharacterEvent(this.characterId);
}
