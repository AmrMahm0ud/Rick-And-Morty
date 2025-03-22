import 'package:json_annotation/json_annotation.dart';
import 'package:rick/data/sources/remote/character/model/remote_location_model.dart';
import 'package:rick/data/sources/remote/character/model/remote_origin_model.dart';
import 'package:rick/domain/entity/character/character.dart';
import 'package:rick/domain/entity/character/location.dart';
import 'package:rick/domain/entity/character/origin.dart';

part 'remote_character_model.g.dart';

@JsonSerializable()
class RemoteCharacterModel {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'species')
  final String? species;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'origin')
  final RemoteOriginModel? origin;

  @JsonKey(name: 'location')
  final RemoteLocationModel? location;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'episode')
  final List<String>? episode;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'created')
  final String? created;

  RemoteCharacterModel({
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
  });

  factory RemoteCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCharacterModelToJson(this);
}

extension RemoteCharacterModelExtension on RemoteCharacterModel {
  Character mapToDomain() {
    return Character(
      id: id ?? 0,
      name: name ?? "",
      status: status ?? "",
      species: species ?? "",
      type: type ?? "",
      created: "",
      episode: episode?.map((e) => e).toList() ?? [],
      gender: gender ?? "",
      image: image ?? "",
      url: url ?? "",
      location: location?.mapToDomain() ?? Location(name: "", url: ""),
      origin: origin?.mapToDomain() ?? Origin(name: "", url: ""),
    );
  }
}

extension RemoteCharacterModelListExtension on List<RemoteCharacterModel> {
  List<Character> mapToDomain() {
    return map((e) => e.mapToDomain()).toList();
  }
}
