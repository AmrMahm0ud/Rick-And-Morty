import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick/core/resources/data_state.dart';
import 'package:rick/domain/entity/character/character_result.dart';
import 'package:rick/domain/usecases/character/call_get_character_api_use_case.dart';

import '../../repositories/character/characters_repository_test.mocks.dart';



void main() {
  late CallGetCharacterApiUseCase useCase;
  late MockCharactersRepository mockRepository;

  setUp(() {
    mockRepository = MockCharactersRepository();
    useCase = CallGetCharacterApiUseCase(mockRepository);
  });

  test('''
    Should call CharactersRepository.getCharacters with correct parameters 
    and return DataSuccess''', () async {
    // Arrange
    const testPage = 1;
    const testName = 'Rick';
    const testStatus = 'Alive';
    const testSpecies = 'Human';

    final testCharacterResult = CharacterResult(characters: []);
    when(mockRepository.getCharacters(
      page: testPage,
      name: testName,
      status: testStatus,
      species: testSpecies,
    )).thenAnswer((_) async => DataSuccess(data: testCharacterResult));

    // Act
    final result = await useCase.call(
      page: testPage,
      name: testName,
      status: testStatus,
      species: testSpecies, // ✅ Correct parameter name
    );

    // Assert
    verify(mockRepository.getCharacters(
      page: testPage,
      name: testName,
      status: testStatus,
      species: testSpecies,
    ));
    expect(result, isA<DataSuccess<CharacterResult>>());
  });
}