import 'package:flutter_test/flutter_test.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/entity/character/location.dart';
import 'package:rick/domain/entity/character/origin.dart';

void main() {
   var testCharacter = Character(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    type: '',
    gender: 'Male',
    origin: Origin(name: 'Earth', url: 'https://...'),
    location: Location(name: 'Earth', url: 'https://...'),
    image: 'https://...',
    episode: ['https://...'],
    url: 'https://...',
    created: '2023-01-01',
    isFavorite: false,
  );

  test('Character properties should be initialized correctly', () {
    expect(testCharacter.id, 1);
    expect(testCharacter.name, 'Rick Sanchez');
    expect(testCharacter.isFavorite, false);
  });

  test('copyWith should update isFavorite', () {
    final copiedCharacter = testCharacter.copyWith(isFavorite: true);
    expect(copiedCharacter.isFavorite, true);
    expect(copiedCharacter.name, 'Rick Sanchez'); // Other fields remain the same
  });

  test('toLocalCharacterModel should convert correctly', () {
    final localModel = testCharacter.toLocalCharacterModel();
    expect(localModel.id, 1);
    expect(localModel.name, 'Rick Sanchez');
  });
}