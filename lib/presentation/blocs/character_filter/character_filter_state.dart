part of 'character_filter_bloc.dart';

@immutable
abstract class CharacterFilterState {}

class CharacterFilterInitial extends CharacterFilterState {}

class CharacterFilterGetDataState extends CharacterFilterState {
  CharacterFilter characterFilter;

  CharacterFilterGetDataState({
    required this.characterFilter,
  });
}

class CharacterFilterSelectStatusState extends CharacterFilterState {
  final List<Lookup> status;

  CharacterFilterSelectStatusState({required this.status});
}

class CharacterFilterSelectSpeciesState extends CharacterFilterState {
  final List<Lookup> species;

  CharacterFilterSelectSpeciesState({required this.species});
}

class CharacterFilterApplyFilterState extends CharacterFilterState {
  CharacterFilter characterFilter;

  CharacterFilterApplyFilterState({
    required this.characterFilter,
  });
}
