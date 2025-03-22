import 'package:rick/core/resources/data_state.dart';
import 'package:rick/data/sources/local/character/database_services.dart';
import 'package:rick/data/sources/local/character/model/local_character_model.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/repositories/favorite_character/favorite_character_repository.dart';

class FavoriteCharacterRepositoryImplementation
    implements FavoriteCharacterRepository {
  final DatabaseService databaseService;

  FavoriteCharacterRepositoryImplementation(this.databaseService);

  @override
  Future<DataState> addFavoriteCharacter(
      LocalCharacterModel localCharacterModel) async {
    try {
      await databaseService.addCharacter(localCharacterModel);
      return DataSuccess();
    } catch (e) {
      return DataFailed(message: "Something went wrong");
    }
  }

  @override
  Future<DataState<List<Character>>> getFavoriteCharacters() async {
    try {
      List<Character> characters = (databaseService.getAllCharacters())
          .map((e) => e.mapToDomain())
          .toList();
      return DataSuccess(data: characters);
    } catch (e) {
      return DataFailed(message: "Something went wrong");
    }
  }

  @override
  Future<DataState> removeFavoriteCharacter(int id) async {
    try {
      await databaseService.deleteCharacter(id);
      return DataSuccess();
    } catch (e) {
      return DataFailed(message: "Something went wrong");
    }
  }
}
