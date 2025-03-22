import 'package:json_annotation/json_annotation.dart';
import 'package:rick/domain/entity/character/origin.dart';

part 'remote_origin_model.g.dart';

@JsonSerializable()
class RemoteOriginModel {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'url')
  final String? url;

  RemoteOriginModel({
    this.name,
    this.url,
  });

  factory RemoteOriginModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteOriginModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOriginModelToJson(this);
}

extension RemoteOriginModelExtension on RemoteOriginModel {
  Origin mapToDomain() {
    return Origin(
      name: name ?? "",
      url: url ?? "",
    );
  }
}
