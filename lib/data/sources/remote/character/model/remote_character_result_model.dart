import 'package:json_annotation/json_annotation.dart';
import 'package:rick/data/sources/remote/character/model/remote_character_model.dart';
import 'package:rick/data/sources/remote/character/model/remote_info_model.dart';
import 'package:rick/domain/entity/character/character_result.dart';

part 'remote_character_result_model.g.dart';

@JsonSerializable()
class RemoteCharacterResultModel {
  @JsonKey(name: 'info')
  final RemoteInfoModel? info;

  @JsonKey(name: 'results')
  final List<RemoteCharacterModel>? remoteCharacterModels;

  RemoteCharacterResultModel({
    this.info,
    this.remoteCharacterModels,
  });

  factory RemoteCharacterResultModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteCharacterResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCharacterResultModelToJson(this);
}

extension RemoteCharacterResultModelExtension on RemoteCharacterResultModel {
  CharacterResult mapToDomain() {
    return CharacterResult(
      characters:
          remoteCharacterModels?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}
