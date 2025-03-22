import 'package:rick/domain/entity/lookup.dart';

class CharacterFilter {
  List<Lookup> status;
  List<Lookup> species;

  CharacterFilter({
    required this.status,
    required this.species,
  });
}
