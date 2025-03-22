import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick/data/sources/remote/character/model/remote_character_result_model.dart';

part 'character_api_services.g.dart';

@RestApi()
abstract class CharacterApiService {
  factory CharacterApiService(Dio dio, {String baseUrl}) = _CharacterApiService;

  @GET("/character/")
  Future<HttpResponse<RemoteCharacterResultModel>> getCharacters(
    @Query("page") int page,
    @Query("status") String? status,
    @Query("species") String? species,
    @Query("name") String? name,
  );
}
