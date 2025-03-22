import 'package:json_annotation/json_annotation.dart';

part 'remote_info_model.g.dart';

@JsonSerializable()
class RemoteInfoModel {
  @JsonKey(name: 'count')
  final int? count;

  @JsonKey(name: 'pages')
  final int? pages;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'prev')
  final String? prev;

  RemoteInfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory RemoteInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteInfoModelToJson(this);
}
