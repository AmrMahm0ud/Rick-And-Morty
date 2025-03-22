import 'package:flutter/material.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/presentation/screens/character_detail/character_detail_screen.dart';
import 'package:rick/presentation/screens/main/main_screen.dart';

class Routes {
  static const String main = "main";
  static const String characterDetail = "characterDetail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.main:
        return _materialRoute(const MainScreen());
      case Routes.characterDetail:
        Character character = routeSettings.arguments as Character;
        return _materialRoute(CharacterDetailScreen(character: character));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: const Center(child: Text("Not found")),
      ),
    );
  }
}
