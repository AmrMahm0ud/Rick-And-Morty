part of 'character_filter_bloc.dart';

@immutable
abstract class CharacterFilterEvent {}

class CharacterFilterGetDataEvent extends CharacterFilterEvent {}

class CharacterFilterSelectStatusEvent extends CharacterFilterEvent {
  final Lookup status;

  CharacterFilterSelectStatusEvent({required this.status});
}

class CharacterFilterSelectSpeciesEvent extends CharacterFilterEvent {
  final Lookup species;

  CharacterFilterSelectSpeciesEvent({required this.species});
}

class CharacterFilterApplyFilterEvent extends CharacterFilterEvent {
  final CharacterFilter characterFilter;

  CharacterFilterApplyFilterEvent({required this.characterFilter});
}
