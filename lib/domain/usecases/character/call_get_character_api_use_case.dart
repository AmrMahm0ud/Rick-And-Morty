import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character_result.dart';
import 'package:rick/domain/repositories/character/characters_repository.dart';

class CallGetCharacterApiUseCase {
  final CharactersRepository _charactersRepository;

  CallGetCharacterApiUseCase(this._charactersRepository);

  Future<DataState<CharacterResult>> call(
      {required int page, String? name, status, species}) async {
    return await _charactersRepository.getCharacters(
        page: page, name: name, species: species, status: status);
  }
}
