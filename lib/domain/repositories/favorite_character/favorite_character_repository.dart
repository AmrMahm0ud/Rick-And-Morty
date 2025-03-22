import 'package:rick/core/resources/data_state.dart';
import 'package:rick/data/sources/local/character/model/local_character_model.dart';
import 'package:rick/domain/entity/character/character.dart';

abstract class FavoriteCharacterRepository {
  Future<DataState> addFavoriteCharacter(LocalCharacterModel localCharacterModel);

  Future<DataState> removeFavoriteCharacter(int id);

  Future<DataState<List<Character>>> getFavoriteCharacters();
}
