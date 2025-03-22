import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/usecases/favorite_character/get_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/un_favorite_character_use_case.dart';

part 'favorite_character_event.dart';

part 'favorite_character_state.dart';

class FavoriteCharacterBloc
    extends Bloc<FavoriteCharacterEvent, FavoriteCharacterState> {
  final UnFavoriteCharacterUseCase unFavoriteCharacterUseCase;
  final GetAllFavoriteCharactersUseCase getAllFavoriteCharactersUseCase;

  FavoriteCharacterBloc(
      {required this.getAllFavoriteCharactersUseCase,
      required this.unFavoriteCharacterUseCase})
      : super(FavoriteCharacterInitial()) {
    on<GetFavoriteCharacterEvent>(_onGetFavoriteCharacterEvent);
    on<UnFavoriteCharacterEvent>(_onUnFavoriteCharacterEvent);
  }

  List<Character> characters = [];

  Future<void> _onGetFavoriteCharacterEvent(GetFavoriteCharacterEvent event,
      Emitter<FavoriteCharacterState> emit) async {
    DataState<List<Character>> localCharacterState =
        await getAllFavoriteCharactersUseCase();

    if (localCharacterState is DataSuccess) {
      characters = localCharacterState.data ?? [];
      emit(SuccessGetFavoriteCharacterState(
          character: localCharacterState.data ?? []));
    }
  }

  Future<void> _onUnFavoriteCharacterEvent(UnFavoriteCharacterEvent event,
      Emitter<FavoriteCharacterState> emit) async {
    emit(FavoriteCharacterShowSkeletonState());
    DataState dataState = await unFavoriteCharacterUseCase(event.characterId);
    if (dataState is DataSuccess) {
      characters.removeWhere((element) => element.id == event.characterId);
      emit(UpdateFavoriteCharacterScreenState(character: characters));
    }
    emit(FavoriteCharacterHideSkeletonState());
  }
}
