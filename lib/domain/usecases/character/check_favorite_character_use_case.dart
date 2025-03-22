import 'package:rick/domain/entity/character/character.dart';

class CheckFavoriteCharacterUseCase {
  CheckFavoriteCharacterUseCase();

  List<Character> call({
    required List<Character> remoteCharacter,
    List<Character> localCharacter = const [],
  }) {
    return remoteCharacter.map((remote) {
      bool isFavorite = localCharacter.any((local) => local.id == remote.id);
      return remote.copyWith(isFavorite: isFavorite);
    }).toList();
  }
}
