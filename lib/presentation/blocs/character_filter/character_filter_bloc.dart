import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:rick/domain/entity/character/character_filter/character_filter.dart';
import 'package:rick/domain/entity/lookup.dart';

part 'character_filter_event.dart';

part 'character_filter_state.dart';

class CharacterFilterBloc
    extends Bloc<CharacterFilterEvent, CharacterFilterState> {
  CharacterFilterBloc() : super(CharacterFilterInitial()) {
    on<CharacterFilterGetDataEvent>(_onCharacterFilterGetDataEvent);
    on<CharacterFilterSelectStatusEvent>(_onCharacterFilterSelectStatusEvent);
    on<CharacterFilterSelectSpeciesEvent>(_onCharacterFilterSelectSpeciesEvent);
    on<CharacterFilterApplyFilterEvent>(_onCharacterFilterApplyFilterEvent);
  }

  Lookup? selectedStatus;
  Lookup? selectedSpecies;

  CharacterFilter characterFilter = CharacterFilter(status: [
    Lookup(id: 1, value: "Alive"),
    Lookup(id: 2, value: "Dead"),
    Lookup(id: 3, value: "Unknown")
  ], species: [
    Lookup(id: 1, value: "Human"),
    Lookup(id: 2, value: "Alien"),
  ]);

  void _onCharacterFilterGetDataEvent(
      CharacterFilterGetDataEvent event, Emitter<CharacterFilterState> emit) {
    if (selectedStatus != null) {
      characterFilter.status = characterFilter.status.map((e) {
        if (e.id == selectedStatus!.id) {
          return e.copyWith(selected: true);
        } else {
          return e.copyWith(selected: false);
        }
      }).toList();
    } else {
      characterFilter.status = characterFilter.status
          .map((e) => e.copyWith(selected: false))
          .toList();
    }

    if (selectedSpecies != null) {
      characterFilter.species = characterFilter.species.map((e) {
        if (e.id == selectedSpecies!.id) {
          return e.copyWith(selected: true);
        } else {
          return e.copyWith(selected: false);
        }
      }).toList();
    } else {
      characterFilter.species = characterFilter.species
          .map((e) => e.copyWith(selected: false))
          .toList();
    }
    emit(CharacterFilterGetDataState(characterFilter: characterFilter));
  }

  void _onCharacterFilterSelectStatusEvent(
      CharacterFilterSelectStatusEvent event,
      Emitter<CharacterFilterState> emit) {
    characterFilter.status = characterFilter.status.map((e) {
      if (e.id == event.status.id) {
        return e.copyWith(selected: !e.isSelected);
      } else {
        return e.copyWith(selected: false);
      }
    }).toList();
    emit(CharacterFilterSelectStatusState(status: characterFilter.status));
  }

  void _onCharacterFilterSelectSpeciesEvent(
      CharacterFilterSelectSpeciesEvent event,
      Emitter<CharacterFilterState> emit) {
    characterFilter.species = characterFilter.species.map((e) {
      if (e.id == event.species.id) {
        return e.copyWith(selected: !e.isSelected);
      } else {
        return e.copyWith(selected: false);
      }
    }).toList();
    emit(CharacterFilterSelectSpeciesState(species: characterFilter.species));
  }

  void _onCharacterFilterApplyFilterEvent(CharacterFilterApplyFilterEvent event,
      Emitter<CharacterFilterState> emit) {
    selectedStatus =
        event.characterFilter.status.firstWhereOrNull((element) => element.isSelected);
    selectedSpecies =
        event.characterFilter.species.firstWhereOrNull((element) => element.isSelected);

    emit(CharacterFilterApplyFilterState(characterFilter: characterFilter));
  }
}
