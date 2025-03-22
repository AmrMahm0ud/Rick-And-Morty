import 'package:flutter/material.dart';
import 'package:rick/config/routes/routes_manager.dart';
import 'package:rick/config/theme/app_theme_manager.dart';
import 'package:rick/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/presentation/blocs/character/character_bloc.dart';
import 'package:rick/presentation/blocs/character_filter/character_filter_bloc.dart';

import 'presentation/blocs/favorite_character/favorite_character_bloc.dart';

Future<void> main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(create: (context) => injector()),
        BlocProvider<CharacterFilterBloc>(create: (context) => injector()),
        BlocProvider<FavoriteCharacterBloc>(create: (context) => injector())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick And Morty Task',
        theme: AppTheme.lightTheme,
        initialRoute: Routes.main,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
