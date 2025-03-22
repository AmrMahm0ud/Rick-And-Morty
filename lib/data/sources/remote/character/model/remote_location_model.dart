import 'package:json_annotation/json_annotation.dart';
import 'package:rick/domain/entity/character/location.dart';

part 'remote_location_model.g.dart';

@JsonSerializable()
class RemoteLocationModel {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'url')
  final String? url;

  RemoteLocationModel({
    this.name,
    this.url,
  });

  factory RemoteLocationModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLocationModelToJson(this);
}


extension RemoteLocationModelExtension on RemoteLocationModel {
  Location mapToDomain() {
    return Location(
      name: name ?? "",
      url: url ?? "",
    );
  }
}