import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/repositories/favorite_character/favorite_character_repository.dart';

class AddFavoriteCharacterUseCase {
  final FavoriteCharacterRepository _favoriteCharacterRepository;

  AddFavoriteCharacterUseCase(this._favoriteCharacterRepository);

  Future<DataState> call(Character character) async {
    return _favoriteCharacterRepository
        .addFavoriteCharacter(character.toLocalCharacterModel());
  }
}
