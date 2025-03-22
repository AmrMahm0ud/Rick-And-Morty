import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick/data/sources/local/character/model/local_character_model.dart';
import 'package:rick/data/sources/local/character/model/local_location_model.dart';
import 'package:rick/data/sources/local/character/model/local_origin_model.dart';

class DatabaseService {
  static const String characterBoxName = 'characterBox';
  late final Box<LocalCharacterModel> _characterBox;

  /// Initialize Hive and open the box
  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(LocalCharacterModelAdapter());
    Hive.registerAdapter(LocalLocationModelAdapter());
    Hive.registerAdapter(LocalOriginModelAdapter());

    _characterBox = await Hive.openBox<LocalCharacterModel>(characterBoxName);
  }

  /// Add a character to the database
  Future<void> addCharacter(LocalCharacterModel character) async {
    await _characterBox.put(character.id, character);
  }

  /// Retrieve all characters
  List<LocalCharacterModel> getAllCharacters() {
    return _characterBox.values.toList();
  }

  /// Delete a character by ID
  Future<void> deleteCharacter(int id) async {
    await _characterBox.delete(id);
  }

  /// Clear all characters from the database
  Future<void> clearDatabase() async {
    await _characterBox.clear();
  }

  /// Close the Hive box when no longer needed
  Future<void> close() async {
    await _characterBox.close();
  }
}
