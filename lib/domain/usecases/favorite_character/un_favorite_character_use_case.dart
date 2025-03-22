import 'package:rick/domain/repositories/favorite_character/favorite_character_repository.dart';

import '../../../../core/resources/data_state.dart';

class UnFavoriteCharacterUseCase {
  final FavoriteCharacterRepository _favoriteCharacterRepository;

  UnFavoriteCharacterUseCase(this._favoriteCharacterRepository);

  Future<DataState> call(int characterId) async {
    return _favoriteCharacterRepository.removeFavoriteCharacter(characterId);
  }
}
