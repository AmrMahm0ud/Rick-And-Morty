import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick/core/resources/data_state.dart';
import 'package:rick/data/sources/remote/character/character_api_services.dart';
import 'package:rick/data/sources/remote/character/model/remote_character_result_model.dart';
import 'package:rick/domain/entity/character/character_result.dart';
import 'package:rick/domain/repositories/character/characters_repository.dart';

class CharacterRepositoryImplementation extends CharactersRepository {
  final CharacterApiService characterApiService;

  CharacterRepositoryImplementation({required this.characterApiService});

  @override
  Future<DataState<CharacterResult>> getCharacters(
      {required int page,
      String? status,
      String? species,
      String? name}) async {
    try {
      final response = await characterApiService.getCharacters(
        page,
        status,
        species,
        name,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: response.data.mapToDomain());
      }
      return DataFailed(message: "Something went wrong");
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.response?.data["error"]}",
      );
    }
  }
}
