import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/usecases/character/call_get_character_api_use_case.dart';
import 'package:rick/domain/usecases/character/check_favorite_character_use_case.dart';

import 'package:rick/domain/usecases/favorite_character/add_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/get_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/un_favorite_character_use_case.dart';

part 'character_event.dart';

part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CallGetCharacterApiUseCase callGetCharacterApiUseCase;
  final AddFavoriteCharacterUseCase addFavoriteCharacterUseCase;
  final UnFavoriteCharacterUseCase unFavoriteCharacterUseCase;
  final GetAllFavoriteCharactersUseCase getAllFavoriteCharactersUseCase;
  final CheckFavoriteCharacterUseCase checkFavoriteCharacterUseCase;

  CharacterBloc(
      {required this.callGetCharacterApiUseCase,
      required this.addFavoriteCharacterUseCase,
      required this.unFavoriteCharacterUseCase,
      required this.getAllFavoriteCharactersUseCase,
      required this.checkFavoriteCharacterUseCase})
      : super(CharacterInitial()) {
    on<GetCharacterCallApiEvent>(_onGetCharacterCallApiEvent);
    on<CharacterResetEvent>(_onCharacterResetEvent);
    on<AddFavoriteCharacterEvent>(_onAddFavoriteCharacterEvent);
    on<UnFavoriteCharacterEvent>(_onUnFavoriteCharacterEvent);
  }

  int currentPage = 1;
  List<Character> characters = [];

  Future<void> _onGetCharacterCallApiEvent(
      GetCharacterCallApiEvent event, Emitter<CharacterState> emit) async {
    if (currentPage > 1) {
      emit(CharacterShowLoadingState());
    } else {
      emit(CharacterShowSkeletonState());
    }
    DataState characterResult = await callGetCharacterApiUseCase(
        page: currentPage,
        name: event.name,
        status: event.status,
        spices: event.species);

    if (characterResult is DataSuccess) {
      characters.addAll(characterResult.data?.characters ?? []);
      DataState<List<Character>> localCharacterState =
          await getAllFavoriteCharactersUseCase();
      if (localCharacterState is DataSuccess) {
        List<Character> localCharacters = localCharacterState.data ?? [];
        characters = checkFavoriteCharacterUseCase(
            remoteCharacter: characters, localCharacter: localCharacters);
      }
      emit(SuccessGetCharacterState(character: characters));
      currentPage++;
    } else if (characterResult is DataFailed) {
      emit(FailGetCharacterState(
          message: characterResult.message ?? "Something went wrong"));
    }

    if (currentPage > 1) {
      emit(CharacterHideLoadingState());
    } else {
      emit(CharacterHideSkeletonState());
    }
  }

  void _onCharacterResetEvent(
      CharacterResetEvent event, Emitter<CharacterState> emit) {
    currentPage = 1;
    characters = [];
    emit(CharacterResetState());
  }

  Future<void> _onAddFavoriteCharacterEvent(
      AddFavoriteCharacterEvent event, Emitter<CharacterState> emit) async {
    characters
        .firstWhere((element) => element.id == event.character.id)
        .isFavorite = true;
    DataState dataState = await addFavoriteCharacterUseCase(event.character);
    if (dataState is DataSuccess) {
      emit(SuccessGetCharacterState(character: characters));
    } else if (dataState is DataFailed) {
      characters
          .firstWhere((element) => element.id == event.character.id)
          .isFavorite = false;
      emit(FailAddFavoriteCharacterState(message: dataState.message ?? ""));
    }
  }

  void _onUnFavoriteCharacterEvent(
      UnFavoriteCharacterEvent event, Emitter<CharacterState> emit) async {
    DataState dataState = await unFavoriteCharacterUseCase(event.id);
    if (dataState is DataSuccess) {
      characters.firstWhere((element) => element.id == event.id).isFavorite =
          false;
      emit(SuccessGetCharacterState(character: characters));
    } else if (dataState is DataFailed) {
      emit(FailUnFavoriteCharacterState(message: dataState.message ?? ""));
    }
  }
}
