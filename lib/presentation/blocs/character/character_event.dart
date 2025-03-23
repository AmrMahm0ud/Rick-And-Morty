part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterCallApiEvent extends CharacterEvent {
  final String name;
  final String status;
  final String species;
  final bool showLoading;

  GetCharacterCallApiEvent(
      {this.name = "",
      this.species = "",
      this.status = "",
      this.showLoading = false});
}

class CharacterResetEvent extends CharacterEvent {}

class AddFavoriteCharacterEvent extends CharacterEvent {
  final Character character;

  AddFavoriteCharacterEvent({required this.character});
}

class UnFavoriteCharacterEvent extends CharacterEvent {
  final int id;

  UnFavoriteCharacterEvent({required this.id});
}
