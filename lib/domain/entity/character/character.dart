import 'package:rick/data/sources/local/character/model/local_character_model.dart';
import 'package:rick/domain/entity/character/location.dart';
import 'package:rick/domain/entity/character/origin.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
  bool isFavorite;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    this.isFavorite = false,
  });

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
    bool? isFavorite,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  LocalCharacterModel toLocalCharacterModel() {
    return LocalCharacterModel(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        origin: origin.toLocalOriginModel(),
        location: location.toLocalLocationModel(),
        image: image,
        episode: episode,
        url: url,
        created: created,
        gender: gender,
        isFavorite: isFavorite);
  }
}
