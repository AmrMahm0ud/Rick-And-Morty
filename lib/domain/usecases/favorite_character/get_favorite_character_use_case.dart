import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/repositories/favorite_character/favorite_character_repository.dart';

class GetAllFavoriteCharactersUseCase {
  final FavoriteCharacterRepository _favoriteCharacterRepository;

  GetAllFavoriteCharactersUseCase(this._favoriteCharacterRepository);

  Future<DataState<List<Character>>> call() async {
    return await _favoriteCharacterRepository.getFavoriteCharacters();
  }
}
