import 'package:dio/dio.dart';
import 'package:rick/core/utils/network/interceptor.dart';
import 'package:rick/data/repositories/character/character_repository_implementation.dart';
import 'package:rick/data/repositories/favorite_character/favorite_character_repository_implementation.dart';
import 'package:rick/data/sources/api_keys.dart';
import 'package:get_it/get_it.dart';
import 'package:rick/data/sources/local/character/database_services.dart';
import 'package:rick/data/sources/remote/character/character_api_services.dart';
import 'package:rick/domain/repositories/character/characters_repository.dart';
import 'package:rick/domain/repositories/favorite_character/favorite_character_repository.dart';
import 'package:rick/domain/usecases/character/call_get_character_api_use_case.dart';
import 'package:rick/domain/usecases/character/check_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/add_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/get_favorite_character_use_case.dart';
import 'package:rick/domain/usecases/favorite_character/un_favorite_character_use_case.dart';
import 'package:rick/presentation/blocs/character/character_bloc.dart';
import 'package:rick/presentation/blocs/character_filter/character_filter_bloc.dart';
import 'package:rick/presentation/blocs/favorite_character/favorite_character_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(
    () => Dio()
      ..options.baseUrl = APIKeys.baseUrl
      ..interceptors.add(
        CustomInterceptors(),
      ),
  );

  // Local Service
  injector.registerSingleton<DatabaseService>(DatabaseService());

  await injector<DatabaseService>().init();

  // Remote Service
  injector.registerFactory<CharacterApiService>(
      () => CharacterApiService(injector()));

  // Repository
  injector.registerFactory<CharactersRepository>(
      () => CharacterRepositoryImplementation(characterApiService: injector()));

  injector.registerFactory<FavoriteCharacterRepository>(
      () => FavoriteCharacterRepositoryImplementation(injector()));

  // UseCase
  injector.registerFactory<CallGetCharacterApiUseCase>(
      () => CallGetCharacterApiUseCase(injector()));

  injector.registerFactory<AddFavoriteCharacterUseCase>(
      () => AddFavoriteCharacterUseCase(injector()));

  injector.registerFactory<GetAllFavoriteCharactersUseCase>(
      () => GetAllFavoriteCharactersUseCase(injector()));

  injector.registerFactory<UnFavoriteCharacterUseCase>(
      () => UnFavoriteCharacterUseCase(injector()));

  injector.registerFactory<CheckFavoriteCharacterUseCase>(
      () => CheckFavoriteCharacterUseCase());

  // Bloc
  injector.registerFactory<CharacterBloc>(() => CharacterBloc(
      callGetCharacterApiUseCase: injector(),
      addFavoriteCharacterUseCase: injector(),
      unFavoriteCharacterUseCase: injector(),
      getAllFavoriteCharactersUseCase: injector(),
      checkFavoriteCharacterUseCase: injector()));

  injector.registerFactory<CharacterFilterBloc>(() => CharacterFilterBloc());

  injector.registerFactory<FavoriteCharacterBloc>(() => FavoriteCharacterBloc(
      getAllFavoriteCharactersUseCase: injector(),
      unFavoriteCharacterUseCase: injector()));
}
