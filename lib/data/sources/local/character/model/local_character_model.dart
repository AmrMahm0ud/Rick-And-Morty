import 'package:hive/hive.dart';
import 'package:rick/data/sources/local/character/model/local_location_model.dart';
import 'package:rick/data/sources/local/character/model/local_origin_model.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/entity/character/location.dart';
import 'package:rick/domain/entity/character/origin.dart';

part 'local_character_model.g.dart';

@HiveType(typeId: 0)
class LocalCharacterModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? status;
  @HiveField(3)
  final String? species;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? gender;
  @HiveField(6)
  final LocalOriginModel? origin;
  @HiveField(7)
  final LocalLocationModel? location;
  @HiveField(8)
  final String? image;
  @HiveField(9)
  final List<String>? episode;
  @HiveField(10)
  final String? url;
  @HiveField(11)
  final String? created;
  @HiveField(12)
  bool? isFavorite;

  LocalCharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
    this.isFavorite = false
  });
}

extension LocalCharacterModelExtension on LocalCharacterModel {
  Character mapToDomain() {
    return Character(
        id: id ?? -1,
        name: name ?? "",
        status: status ?? "",
        species: species ?? "",
        type: type ?? "",
        gender: gender ?? "",
        origin: origin?.mapToDomain() ?? Origin(name: "", url: ""),
        location: location?.mapToDomain() ?? Location(name: "", url: ""),
        image: image ?? "",
        episode: episode?.map((e) => e).toList() ?? [],
        url: url ?? "",
        created: created ?? "" , isFavorite: isFavorite ?? false);
  }
}
