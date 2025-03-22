import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character_result.dart';

abstract class CharactersRepository {
  Future<DataState<CharacterResult>> getCharacters({
    required int page,
    String? status,
    String? species,
    String? name,
  });
}
